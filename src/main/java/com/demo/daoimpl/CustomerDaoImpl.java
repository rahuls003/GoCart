package com.demo.daoimpl;

import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import com.demo.dao.CustomerDao;
import com.demo.model.Customer;
import com.demo.model.Authorities;
import com.demo.model.BillingAddress;
import com.demo.model.Cart;
import com.demo.model.ShippingAddress;
import com.demo.model.User;

@Repository
@Transactional
public class CustomerDaoImpl implements CustomerDao {

	@Autowired
	private SessionFactory sessionFactory;

	public List<Customer> getAllCustomer() {
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("from Customer");
		List<Customer> customer = query.list();
		session.close();
		return customer;
	}

	public Customer getCustomerById(int custid) {
		Session session = sessionFactory.getCurrentSession();
		return (Customer) session.get(Customer.class, custid);
	}

	public void addCustomer(Customer customer) {
		Session session = sessionFactory.openSession();

		BillingAddress billingAddress = customer.getBillingAddress();
		ShippingAddress shippingAddress = customer.getShippingAddress();
		customer.setBillingAddress(billingAddress);
		customer.setShippingAddress(shippingAddress);
		billingAddress.setCustomer(customer);
		shippingAddress.setCustomer(customer);

		User user = new User();
		user.setUserid(customer.getCustid());
		user.setUsername(customer.getUsername());
		customer.getUser();
		customer.setUser(user);
		
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		user.setPassword(encoder.encode(customer.getPassword()));
		customer.setPassword(encoder.encode(customer.getPassword()));
		
		user.setEnabled(true);

		Authorities authority = new Authorities();
		authority.setAuthority("ROLE_USER");
		authority.setUsername(customer.getUsername());

		
		 Cart cart=new Cart();
		 
		customer.setCart(cart); cart.setCustomer(customer);
		 

		session.saveOrUpdate(billingAddress);
		session.saveOrUpdate(shippingAddress);
		session.saveOrUpdate(user);
		session.saveOrUpdate(authority);
		session.saveOrUpdate(customer);
		 session.saveOrUpdate(cart); 

		session.flush();
		session.close();

	}

	public Customer getCustomerByUsername(String username) {
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("from User where username=?");
		query.setString(0, username);
		User user = (User) query.uniqueResult();
		Customer customer = user.getCustomer();
		session.close();
		return customer;
	}

}
