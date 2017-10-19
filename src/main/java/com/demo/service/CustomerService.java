package com.demo.service;

import java.util.List;

import com.demo.model.Customer;

public interface CustomerService {

	public List<Customer> getAllCustomer();

	Customer getCustomerById(int custid);

	public void addCustomer(Customer customer);

	Customer getCustomerByUsername(String username);

}
