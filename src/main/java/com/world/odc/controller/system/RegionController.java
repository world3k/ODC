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
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
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
import com.world.odc.model.domain.Member;
import com.world.odc.model.domain.Region;
import com.world.odc.model.domain.Role;

/**
 * region management controller
 */
@Controller
@RequestMapping("/system/region")
@Transactional(readOnly = true)
public class RegionController {

    Logger logger = Logger.getLogger(RoleController.class);

    @Autowired
    RegionDao regionDao;

    @Autowired
    MemberDao memberDao;
    
   

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
    public DataGrid<Region> list() {
        
    	return new DataGrid<>(regionDao.findAll(new Sort(Direction.DESC, "id")));
    }

    @RequestMapping("/form")
    public void form(Long id, Model model) {
        if (id != null) {
            ObjectMapper mapper = new ObjectMapper();
            Region region = regionDao.findOne(id);
            try {
                model.addAttribute("region", mapper.writeValueAsString(region));
            } catch (JsonProcessingException e) {
                logger.error("json convertion error", e);
            }
        }
    }

    @RequestMapping("/check")
    @ResponseBody
    public boolean check(String name) {
        return regionDao.countByName(name) == 0;
    }

    /*
    @RequestMapping("/members")
    @ResponseBody
    public List<Member> members() {
    	
    	return memberDao.findAll();
        
    }
    */
   

    @RequestMapping({"/save", "/update"})
    @Transactional
    @ResponseBody
    public AjaxResult save(@Valid Region region, Long[] roles, BindingResult br) {
        if (br.hasErrors()) {
            logger.error("Verification error:" + br.getAllErrors());
            return new AjaxResult(false).setData(br.getAllErrors());
        } else {
            if (region.getId() != null) {
                
                Region orig = regionDao.findOne(region.getId());
                
            }            

            regionDao.save(region);

            return new AjaxResult();
        }
    }
    

    
}
