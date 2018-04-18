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
@Table(name = "product")
public class Product {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@ManyToMany(targetEntity=Member.class)
	@JoinTable(name="member_product",
	joinColumns={
			@JoinColumn(name="prod_id")
	},inverseJoinColumns={
			@JoinColumn(name="member_id")
	})
    private List<Member> members;
	
	@Column(length = 30, unique = true, nullable = false)
	private String prodName;

	@Column(length = 512)
	private String description;
	
	@Column(length = 30, unique = true, nullable = false)
	private String color;
	
	@Column(length = 30, unique = true, nullable = false)
	private Float weight;
	
	public List<Member> getMembers() {
		return members;
	}

	public void setMembers(List<Member> members) {
		this.members = members;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public Float getWeight() {
		return weight;
	}

	public void setWeight(Float weight) {
		this.weight = weight;
	}

	private Boolean status = true;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getProdName() {
		return prodName;
	}

	public void setProdName(String prodName) {
		this.prodName = prodName;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Boolean getStatus() {
		return status;
	}

	public void setStatus(Boolean status) {
		this.status = status;
	}
	
	
	


	@Override
	public String toString() {
		return "Prod [id=" + id + ",prodName=" + prodName + ", description=" + description + ", status=" + status
				+ "]";
	}
}
