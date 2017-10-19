package com.demo.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Transient;
import javax.validation.constraints.Min;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.demo.model.Category;
import com.demo.model.Supplier;

@Entity
public class Product implements Serializable {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int productId;
	
	@NotEmpty(message = "The product name must not be empty")
	private String productName;
	
	private String productDescription;

    @Min(value = 0, message = "The product price must not be less then zero")
    private double productPrice;
    private String productCondition;
    private String productStatus;

    @Min(value = 0, message = "The product unit must not be less then zero")
    private int unitInStock;

    @Transient                // Not persist/save in database.just on server.
	private MultipartFile image;
    
    @ManyToOne					
    @JoinColumn(name = "categoryId")
    @JsonIgnore
    private Category category;
	
	@ManyToOne
    @JoinColumn(name = "supplierId")
    @JsonIgnore
    private Supplier supplier;
    
 
	public MultipartFile getImage() {
		return image;
	}

	public void setImage(MultipartFile image) {
		this.image = image;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public String getProductDescription() {
		return productDescription;
	}

	public void setProductDescription(String productDescription) {
		this.productDescription = productDescription;
	}

	public double getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(double productPrice) {
		this.productPrice = productPrice;
	}

	public String getProductCondition() {
		return productCondition;
	}

	public void setProductCondition(String productCondition) {
		this.productCondition = productCondition;
	}

	public String getProductStatus() {
		return productStatus;
	}

	public void setProductStatus(String productStatus) {
		this.productStatus = productStatus;
	}

	public int getUnitInStock() {
		return unitInStock;
	}

	public void setUnitInStock(int unitInStock) {
		this.unitInStock = unitInStock;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public Supplier getSupplier() {
		return supplier;
	}

	public void setSupplier(Supplier supplier) {
		this.supplier = supplier;
	}
	
	
}
