package com.world.odc.model.domain;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

@Entity
@Table(name = "region")
public class Region {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@ManyToMany(targetEntity=Member.class)
	@JoinTable(name="member_region",
	joinColumns={
			@JoinColumn(name="region_id")
	},inverseJoinColumns={
			@JoinColumn(name="member_id")
	})
    private List<Member> members;
	
	@Column(length = 30, unique = true, nullable = false)
	private String name;

	@Column(length = 100)
	private String description;
	
	@Column(length = 30)
	private String whName;

	public String getWhName() {
		return whName;
	}

	public void setWhName(String whName) {
		this.whName = whName;
	}

	@Column(name="whaddress",length = 100)
	private String whAddress;
	
	public String getWhAddress() {
		return whAddress;
	}

	public void setWhAddress(String whAddress) {
		this.whAddress = whAddress;
	}


	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	
	public List<Member> getMembers() {
		return members;
	}
	
	public void setMembers(List<Member> members) {
		this.members = members;
	}

	@Column(length = 100, unique = false, nullable = true)
	private String whDesc;
	
	
	public String getWhDesc() {
		return whDesc;
	}

	public void setWhDesc(String whDesc) {
		this.whDesc = whDesc;
	}

	@Override
	public String toString() {
		return "Region [id=" + id + ", name=" + name + ", description=" + description +" ,whName="+whName+" ,whDesc="+whDesc+ "]";
	}
}
