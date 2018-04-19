package com.world.odc.model.dao;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

import com.world.odc.model.domain.Inventory;
import com.world.odc.model.domain.Member;

@Repository
public interface InventoryDao extends PagingAndSortingRepository<Inventory, Long>, JpaSpecificationExecutor {
    
    
}
