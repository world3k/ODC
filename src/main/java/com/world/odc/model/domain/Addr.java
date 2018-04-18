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
@Table(name = "addr")
public class Addr {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@ManyToMany(targetEntity=Member.class)
	@JoinTable(name="member_address",
	joinColumns={
			@JoinColumn(name="address_id")
	},inverseJoinColumns={
			@JoinColumn(name="member_id")
	})
    private List<Member> members;
	
	@Column(length = 30, unique = true, nullable = false)
	private String address;


	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
	

	public List<Member> getMember() {
		return members;
	}
	
	public void setMember(List<Member> members) {
		this.members = members;
	}

	@Override
	public String toString() {
		return "Addr [id=" + id + ", address=" + address + "]";
	}
}

