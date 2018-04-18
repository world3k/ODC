package com.world.odc.model.domain;

import com.fasterxml.jackson.annotation.JsonGetter;
import com.fasterxml.jackson.annotation.JsonProperty;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "category")
public class Category {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @JsonProperty(value = "_parentId")
    @ManyToOne
    private Category parent;

    @Column(length = 30, nullable = false)
    private String name;

    @Column(length = 100, nullable = false, unique = true)
    private String description;
    
    private Integer weight = 0;

    private Boolean status = false;
   

    public Integer getWeight() {
		return weight;
	}

	public void setWeight(Integer weight) {
		this.weight = weight;
	}

	public Boolean getStatus() {
		return status;
	}

	public void setStatus(Boolean status) {
		this.status = status;
	}

	/**
     * none persistent field. 
     */
    @Transient
    private List<Category> children = new ArrayList<Category>();

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Category getParent() {
        return parent;
    }

    public void setParent(Category parent) {
        this.parent = parent;
    }

    public String getname() {
        return name;
    }

    public void setname(String name) {
        this.name = name;
    }


    public List<Category> getChildren() {
        return children;
    }

    public void setChildren(List<Category> children) {
        this.children = children;
    }

    
    /**
     * 给JSON序列化时，获取ID
     *
     * @return
     */
    @JsonGetter("_parentId")
    public Long getParentId() {
        if (this.parent != null) {
            return this.parent.getId();
        }
        return null;
    }

    @JsonGetter("parent")
    public Long getParentId2() {
        if (this.parent != null) {
            return this.parent.getId();
        }
        return null;
    }

    /**
     * tree accepts text only.
     *
     * @return
     */
    @JsonGetter("text")
    public String getText() {
        return this.name;
    }

    @Override
    public String toString() {
        return "Resource [id=" + id + ", name=" + name + ", description=" + description  + ", status=" + status+ "]";
    }
}
