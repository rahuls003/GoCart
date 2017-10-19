package com.demo.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.dao.CustomerDao;
import com.demo.model.Customer;
import com.demo.service.CustomerService;

@Service
public class CustomerServiceImpl implements CustomerService{

	@Autowired
	private CustomerDao customerDao;

	public List<Customer> getAllCustomer() {
		return customerDao.getAllCustomer() ;
	}

	public Customer getCustomerById(int custid) {
		return customerDao.getCustomerById(custid);
	}

	public void addCustomer(Customer customer) {
		customerDao.addCustomer(customer);
	}

	public Customer getCustomerByUsername(String username) {
		return customerDao.getCustomerByUsername(username);
	}
	
}
