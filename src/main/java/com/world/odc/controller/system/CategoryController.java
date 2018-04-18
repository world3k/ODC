package com.world.odc.controller.system;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.world.odc.common.AjaxResult;
import com.world.odc.common.DataGrid;
import com.world.odc.model.dao.CategoryDao;
import com.world.odc.model.domain.Category;
import com.world.odc.service.CategoryService;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.validation.Valid;

/**
 * category controller
 */
@Controller
@RequestMapping("/system/category")
@Transactional(readOnly = true)
public class CategoryController {

    Logger logger = Logger.getLogger(RoleController.class);

    @Autowired
    CategoryDao categoryDao;

    @Autowired
    CategoryService categoryService;

    @RequestMapping
    public void index() {
    }

    @RequestMapping("/list")
    @ResponseBody
    public DataGrid<Category> list() {
        return new DataGrid<>(categoryDao.findAll(CategoryDao.WEIGHT_SORT));
    }

    @RequestMapping("/parent/tree")
    @ResponseBody
    public Iterable<Category> parentTree() {
        return categoryService.getCategoryTree();
    }

    @RequestMapping("form")
    public void form(Long id, Model model) {
        if (id != null) {
            ObjectMapper mapper = new ObjectMapper();
            Category category = categoryDao.findOne(id);
            try {
                model.addAttribute("category", mapper.writeValueAsString(category));
            } catch (JsonProcessingException e) {
                logger.error("json conversion error", e);
            }
            if (category.getParent() != null) {
                model.addAttribute("parentId", category.getParent().getId());
            }
        }
    }

    @RequestMapping({"/save", "/update"})
    @Transactional
    @ResponseBody
    public Object save(@Valid Category category, BindingResult br) {
        if (br.hasErrors()) {
            logger.error("object verfication failure:" + br.getAllErrors());
            return new AjaxResult(false).setData(br.getAllErrors());
        } else {
            return categoryDao.save(category);
        }
    }

    @RequestMapping("/delete")
    @Transactional
    @ResponseBody
    public AjaxResult delete(Long id) {
        try {
            categoryDao.delete(id);
        } catch (Exception e) {
            return new AjaxResult().setMessage(e.getMessage());
        }
        return new AjaxResult();
    }
}
