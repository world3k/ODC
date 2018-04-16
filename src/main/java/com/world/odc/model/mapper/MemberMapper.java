package com.world.odc.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.world.odc.model.domain.Member;

@Mapper
public interface MemberMapper {

	public List<Member> findAll();
}
