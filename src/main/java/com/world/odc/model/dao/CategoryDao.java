package com.world.odc.model.dao;

import java.util.List;

import org.springframework.data.domain.Sort;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

import com.world.odc.model.domain.Category;

@Repository
public interface CategoryDao extends PagingAndSortingRepository<Category, Long> {

    /**
     * 默认权重排序
     */
    Sort WEIGHT_SORT = new Sort(Sort.Direction.DESC, "weight");

    //管理列表树形数据
    List<Category> findByParentIsNull();

    List<Category> findByParent(Category category, Sort sort);


    //查找可用的资源
    List<Category> findByStatusAndParentIsNull(Boolean status, Sort sort);

    List<Category> findByStatusAndParent(Boolean status, Category category, Sort sort);

    List<Category> findByStatus(Boolean status, Sort sort);
}
