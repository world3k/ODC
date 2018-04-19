package com.world.odc.model.dao;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

import com.world.odc.model.domain.Region;

@Repository
public interface RegionDao extends PagingAndSortingRepository<Region, Long>, JpaSpecificationExecutor {

    int countByName(String name);

    Region findByName(String name);
    Region findById(Long id);
    
}
