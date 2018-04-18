package com.world.odc.controller.system;

import javax.validation.Valid;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.world.odc.common.AjaxResult;
import com.world.odc.common.DataGrid;
import com.world.odc.model.dao.AddrDao;
import com.world.odc.model.domain.Addr;

/**
 * Address controller
 */
@Controller
@RequestMapping("/system/addr")
@Transactional(readOnly = true)
public class AddrController {

    Logger logger = Logger.getLogger(RoleController.class);

    @Autowired
    AddrDao addrDao;


    @RequestMapping
    public void index() {
    }

    @RequestMapping("/list")
    @ResponseBody
    public DataGrid<Addr> list() {
        return new DataGrid<>(addrDao.findAll(new Sort(Direction.DESC, "id")));
    }

    @RequestMapping({"/save", "/update"})
    @Transactional
    @ResponseBody
    public Object save(@Valid Addr addr, BindingResult br) {
        if (br.hasErrors()) {
            logger.error("object verification failure：" + br.getAllErrors());
            return new AjaxResult(false).setData(br.getAllErrors());
        } else {
            return addrDao.save(addr);
        }
    }

    @RequestMapping("/delete")
    @Transactional
    @ResponseBody
    public AjaxResult delete(Long id) {
        try {
           addrDao.delete(id);
        } catch (Exception e) {
            return new AjaxResult().setMessage(e.getMessage());
        }
        return new AjaxResult();
    }
    
}
