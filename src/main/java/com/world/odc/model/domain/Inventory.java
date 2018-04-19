package com.world.odc.model.domain;

import java.util.Date;
import java.util.List;

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
import com.world.odc.model.enums.Gender;
import com.world.odc.model.enums.InvStatus;

/**
 * inventory.
 */
@Entity
@Table(name = "inventory")
public class Inventory {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name="max_quantity")
    private float maxQuantity;


    @Column(name="amountinstock")
    @JsonFormat(pattern = "yyyy-MM-dd")
    private float amountInStock;

    @Column(name="refill_date")
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date refillDate;

    @Column(name="refill_point")
    private float refillPoint;

    @Column(name="price", nullable=false)
    private float price;

    
    @Column(length = 256)
    private String avatar;
    
    @Column(name="inv_status", length = 16)
    @Enumerated(EnumType.STRING)
    private InvStatus invStatus;


    @ManyToMany(targetEntity = Product.class)
    @JoinTable(name = "inv_product",
            joinColumns = {
                    @JoinColumn(name = "inv_id")
            }, inverseJoinColumns = {
            @JoinColumn(name = "prod_id")
    })
    private List<Product> products;
    
        
    
    @ManyToMany(targetEntity = Region.class)
    @JoinTable(name = "inv_region",
            joinColumns = {
                    @JoinColumn(name = "inv_id")
            }, inverseJoinColumns = {
            @JoinColumn(name = "region_id")
    })    
    
    private List<Region> region;
    

   
    
    

    public Long getId() {
		return id;
	}






	public void setId(Long id) {
		this.id = id;
	}






	public float getMaxQuantity() {
		return maxQuantity;
	}






	public void setMaxQuantity(float maxQuantity) {
		this.maxQuantity = maxQuantity;
	}






	public float getAmountInStock() {
		return amountInStock;
	}






	public void setAmountInStock(float amountInStock) {
		this.amountInStock = amountInStock;
	}






	public Date getRefillDate() {
		return refillDate;
	}






	public void setRefillDate(Date refillDate) {
		this.refillDate = refillDate;
	}






	public float getRefillPoint() {
		return refillPoint;
	}






	public void setRefillPoint(float refillPoint) {
		this.refillPoint = refillPoint;
	}






	public float getPrice() {
		return price;
	}






	public void setPrice(float price) {
		this.price = price;
	}






	public InvStatus getInvStatus() {
		return invStatus;
	}






	public void setInvStatus(InvStatus invStatus) {
		this.invStatus = invStatus;
	}




	public List<Product> getProducts() {
		return products;
	}






	public void setProducts(List<Product> products) {
		this.products = products;
	}






	public List<Region> getRegion() {
		return region;
	}






	public void setRegion(List<Region> region) {
		this.region = region;
	}



	@Override
    public String toString() {
        return "Inventory [id=" + id + ", maxQuantity=" + maxQuantity + ", amountInStock=" + amountInStock + ", refillDate=" + refillDate
                + ", refillPoint=" + refillPoint + ", price=" + price + ", invStatus=" + invStatus + "]";
    }

}
