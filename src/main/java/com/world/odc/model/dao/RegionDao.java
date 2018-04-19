package com.world.odc.model.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

import com.world.odc.model.domain.Region;

@Repository
public interface RegionDao extends PagingAndSortingRepository<Region, Long>  {

    List<Region> findAll();
    List<Region> findById(Long id);
    int countByName(String name);
    Region findByName(String name);
    
}

