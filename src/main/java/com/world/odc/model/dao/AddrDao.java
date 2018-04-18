package com.world.odc.model.dao;

import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

import com.world.odc.model.domain.Addr;

import java.util.List;

@Repository
public interface AddrDao extends PagingAndSortingRepository<Addr, Long> {

}
