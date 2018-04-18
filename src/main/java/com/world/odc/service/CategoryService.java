package com.world.odc.service;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.world.odc.model.dao.CategoryDao;
import com.world.odc.model.domain.Category;

@Service
public class CategoryService {

    Logger logger = Logger.getLogger(CategoryService.class);

    @Autowired
    CategoryDao categoryDao;

    /**
     * 获取资源树
     *
     * @param status
     * @return
     */
    public Iterable<Category> getCategoryTree(Boolean status) {
        Iterable<Category> root;
        if (status == null) {
            root = categoryDao.findByParentIsNull();
        } else {
            root = categoryDao.findByStatusAndParentIsNull(status, CategoryDao.WEIGHT_SORT);
        }
        this.buildTree(root, status);
        return root;
    }

    public Iterable<Category> getCategoryTree() {
        return this.getCategoryTree(null);
    }

    private void buildTree(Iterable<Category> root, Boolean status) {
        root.forEach(t -> {
            Iterable<Category> children;

            if (status == null) {
                children = categoryDao.findByParent(t, CategoryDao.WEIGHT_SORT);
            } else {
                children = categoryDao.findByStatusAndParent(status, t, CategoryDao.WEIGHT_SORT);
            }

            children.forEach(c -> t.getChildren().add(c));

            // iterative
            buildTree(children, status);
        });
    }
}
