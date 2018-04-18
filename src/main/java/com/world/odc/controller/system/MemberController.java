package com.world.odc.controller.system;

import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.world.odc.common.AjaxResult;
import com.world.odc.common.DataGrid;
import com.world.odc.common.MySpecification;
import com.world.odc.common.MySpecification.Cnd;
import com.world.odc.model.dao.MemberDao;
import com.world.odc.model.dao.RegionDao;
import com.world.odc.model.dao.RoleDao;
import com.world.odc.model.domain.Member;
import com.world.odc.model.domain.Region;
import com.world.odc.model.domain.Role;

/**
 * member management controller
 */
@Controller
@RequestMapping("/system/member")
@Transactional(readOnly = true)
public class MemberController {

    Logger logger = Logger.getLogger(RoleController.class);

    @Autowired
    MemberDao memberDao;

    @Autowired
    RoleDao roleDao;
    
   

    /**
     * Super administrator id
     */
    @Value("${crm.system.super-user-id}")
    Long superUserId;

    @RequestMapping
    public void index() {

    }

    @RequestMapping("/list")
    @ResponseBody
    public DataGrid<Member> list(int page, int rows, String userName, String realName, String telephone) {
        PageRequest pr = new PageRequest(page - 1, rows);

        
        Page pageData = memberDao.findAll(new MySpecification<Member>().and(
                Cnd.like("userName", userName),
                Cnd.like("realName", realName),
                Cnd.eq("telephone", telephone)
        ).asc("id"), pr);

        return new DataGrid<>(pageData);
    }

    @RequestMapping("/form")
    public void form(Long id, Model model) {
        if (id != null) {
            ObjectMapper mapper = new ObjectMapper();
            Member member = memberDao.findOne(id);
            try {
                model.addAttribute("member", mapper.writeValueAsString(member));
            } catch (JsonProcessingException e) {
                logger.error("json convertion error", e);
            }
        }
    }

    @RequestMapping("/check")
    @ResponseBody
    public boolean check(String userName) {
        return memberDao.countByUserName(userName) == 0;
    }

    @RequestMapping("/roles")
    @ResponseBody
    public List<Role> roles() {
        return roleDao.findByStatus(true);
    }
    
   

    @RequestMapping({"/save", "/update"})
    @Transactional
    @ResponseBody
    public AjaxResult save(@Valid Member member, Long[] roles, BindingResult br) {
        if (br.hasErrors()) {
            logger.error("Verification error:" + br.getAllErrors());
            return new AjaxResult(false).setData(br.getAllErrors());
        } else {
            if (member.getId() != null) {
                
                Member orig = memberDao.findOne(member.getId());
                
                if (orig != null) {
                    member.setPassword(orig.getPassword());
                }
            } else {
                // default password
                member.setPassword(DigestUtils.sha256Hex("0000"));
            }

            //handle roles
            if (roles != null && roles.length > 1) {
                List<Role> rolesList = new ArrayList<>();
                for (Long rid : roles) {
                    if (rid != null) {
                        rolesList.add(roleDao.findOne(rid));
                    }
                }
                member.setRoles(rolesList);
            }

            memberDao.save(member);

            return new AjaxResult();
        }
    }

    /**
     * Rest password
     *
     * @param id
     * @return
     */
    @RequestMapping("/password/reset")
    @Transactional
    @ResponseBody
    public AjaxResult resetPassword(Long id) {
        Member member = memberDao.findOne(id);
        member.setPassword(DigestUtils.sha256Hex("0000"));
        memberDao.save(member);
        return new AjaxResult();
    }

    @RequestMapping("/delete")
    @Transactional
    @ResponseBody
    public AjaxResult delete(Long id) {
        try {
            if (superUserId != id) {
                memberDao.delete(id);
            } else {
                return new AjaxResult(false, "It disallowed to delete the administrator！");
            }
        } catch (Exception e) {
            return new AjaxResult(false).setMessage(e.getMessage());
        }
        return new AjaxResult();
    }
}
