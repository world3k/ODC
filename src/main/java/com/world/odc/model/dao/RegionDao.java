package com.world.odc.model.dao;

import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

import com.world.odc.model.domain.Region;

import java.util.List;

@Repository
public interface RegionDao extends PagingAndSortingRepository<Region, Long> {

    List<Region> findAll();
    List<Region> findById(Long id);
}
