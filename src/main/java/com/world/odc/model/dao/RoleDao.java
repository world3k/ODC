package com.world.odc.model.dao;

import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

import com.world.odc.model.domain.Role;

import java.util.List;

@Repository
public interface RoleDao extends PagingAndSortingRepository<Role, Long> {

    List<Role> findByStatus(boolean b);
}
