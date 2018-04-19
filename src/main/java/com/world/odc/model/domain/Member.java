package com.world.odc.model.domain;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.world.odc.model.enums.Gender;

/**
 * customer and employees.
 */
@Entity
@Table(name = "crm_member")
public class Member {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
 
    @ManyToMany(mappedBy = "members")
	@JsonIgnoreProperties("members")
	protected List<Region> regions;
    
    @Column(length = 64, nullable = false, unique = true, updatable = false)
    private String userName;

    @Column(length = 128, nullable = false)
    @JsonIgnore//
    private String password;

    @Column(length = 64, nullable = false)
    private String realName;

    @Column(length = 16)
    @Enumerated(EnumType.STRING)
    private Gender gender;

    @Column(length = 64)
    private String telephone;

    @Column(length = 128)
    private String email;

    @Column(length = 256)
    private String avatar;

    /**
     * 
     */
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date hiredate;

    private Boolean status = false;
  
    
  	@ManyToMany(targetEntity = Role.class)
    @JoinTable(name = "crm_member_role",
            joinColumns = {
                    @JoinColumn(name = "member_id")
            }, inverseJoinColumns = {
            @JoinColumn(name = "role_id")
    })
    private List<Role> roles;
   
    
    @ManyToMany(targetEntity = Category.class)
    @JoinTable(name = "member_category",
            joinColumns = {
                    @JoinColumn(name = "member_id")
            }, inverseJoinColumns = {
            @JoinColumn(name = "category_id")
    })    
    
    private List<Category> categories;
    

    @ManyToMany(targetEntity = Addr.class)
    @JoinTable(name = "member_addr",
            joinColumns = {
                    @JoinColumn(name = "member_id")
            }, inverseJoinColumns = {
            @JoinColumn(name = "addr_id")
    })  
    
    private List<Addr> addrs;
    
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRealName() {
        return realName;
    }

    public void setRealName(String realName) {
        this.realName = realName;
    }

    public Gender getGender() {
        return gender;
    }

    public void setGender(Gender gender) {
        this.gender = gender;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Date getHiredate() {
        return hiredate;
    }

    public void setHiredate(Date hiredate) {
        this.hiredate = hiredate;
    }

    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }

    public List<Role> getRoles() {
        return roles;
    }
    
    public void setRoles(List<Role> roles) {
        this.roles= roles;
    }
    

    
    public void setCategories(List<Category> categories) {
        this.categories= categories;
    }
   
    public List<Category> getCategories() {
        return categories;
    }
    
    
    public List<Addr> getAddrs() {
        return addrs;
    }
    
    public void setAddrs(List<Addr> addrs) {
        this.addrs= addrs;
    }
    
    
    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getAvatar() {
        return avatar;
    }
    
    

    public List<Region> getRegions() {
		return regions;
	}

	public void setRegions(List<Region> regions) {
		this.regions = regions;
	}

	@Override
    public String toString() {
        return "Member [id=" + id + ", userName=" + userName + ", password=" + password + ", realName=" + realName
                + ", gender=" + gender + ", telephone=" + telephone + ", email=" + email + ", hiredate=" + hiredate
                + ", status=" + status + "]";
    }

}
