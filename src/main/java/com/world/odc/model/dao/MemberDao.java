package com.world.odc.model.dao;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

import com.world.odc.model.domain.Member;

@Repository
public interface MemberDao extends PagingAndSortingRepository<Member, Long>, JpaSpecificationExecutor {

    int countByUserName(String userName);

    Member findByUserName(String userName);
    Member findById(Long id);
    
}
