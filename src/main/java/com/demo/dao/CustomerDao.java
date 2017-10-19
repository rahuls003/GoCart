package com.demo.dao;

import java.util.List;

import com.demo.model.Customer;

public interface CustomerDao {

	public List<Customer> getAllCustomer();
	
	Customer getCustomerById(int custid);

	public void addCustomer(Customer customer);

	Customer getCustomerByUsername(String username);
}
