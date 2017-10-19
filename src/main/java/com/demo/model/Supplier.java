package com.demo.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import org.hibernate.validator.constraints.NotEmpty;

import com.demo.model.Product;

@Entity
public class Supplier implements Serializable{

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int supplierId;
	
	@NotEmpty(message = "The supplier name must not be empty")
	private String supplierName; 
	
	private String supplierCity;
	private String supplierPhoneno;
	
	@OneToMany(mappedBy = "supplier", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	private List<Product> product;
	
	public int getSupplierId() {
		return supplierId;
	}
	public void setSupplierId(int supplierId) {
		this.supplierId = supplierId;
	}
	public String getSupplierName() {
		return supplierName;
	}
	public void setSupplierName(String supplierName) {
		this.supplierName = supplierName;
	}
	public String getSupplierCity() {
		return supplierCity;
	}
	public void setSupplierCity(String supplierCity) {
		this.supplierCity = supplierCity;
	}
	public String getSupplierPhoneno() {
		return supplierPhoneno;
	}
	public void setSupplierPhoneno(String supplierPhoneno) {
		this.supplierPhoneno = supplierPhoneno;
	}
	public List<Product> getProduct() {
		return product;
	}
	public void setProduct(List<Product> product) {
		this.product = product;
	}
	
}
