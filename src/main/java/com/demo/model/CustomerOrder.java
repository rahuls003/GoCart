package com.demo.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

@Entity
public class CustomerOrder implements Serializable{

	
		@Id
	    @GeneratedValue(strategy=GenerationType.AUTO)
		private int orderId;
	
	 	@OneToOne
	    @JoinColumn(name = "cartId")
	    private Cart cart;
	 
	 	@OneToOne
	    @JoinColumn(name = "custid")
	    private Customer customer;

		@OneToOne
	    @JoinColumn(name = "billId")
	    private BillingAddress billingAddress;

	    @OneToOne
	    @JoinColumn(name="shipId")
	    private ShippingAddress shippingAddress;

		public int getOrderId() {
			return orderId;
		}

		public void setOrderId(int orderId) {
			this.orderId = orderId;
		}

		public Cart getCart() {
			return cart;
		}

		public void setCart(Cart cart) {
			this.cart = cart;
		}

		public Customer getCustomer() {
			return customer;
		}

		public void setCustomer(Customer customer) {
			this.customer = customer;
		}

		public BillingAddress getBillingAddress() {
			return billingAddress;
		}

		public void setBillingAddress(BillingAddress billingAddress) {
			this.billingAddress = billingAddress;
		}

		public ShippingAddress getShippingAddress() {
			return shippingAddress;
		}

		public void setShippingAddress(ShippingAddress shippingAddress) {
			this.shippingAddress = shippingAddress;
		}

	    
	    
}
