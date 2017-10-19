package com.demo.daoimpl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.demo.dao.ProductDao;
import com.demo.model.Product;

@Repository
@Transactional
public class ProductDaoImpl implements ProductDao {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	public void addProduct(Product product) {
		Session session = sessionFactory.openSession();
		session.saveOrUpdate(product);
		session.flush();
		session.close();
		
		
	}

	public List<Product> getAllProduct() {
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("from Product");
		List<Product> product = query.list();
		session.close();
		return product;
	}

	public Product getProductById(int productId) {
		Session session = sessionFactory.openSession();
		Product product = (Product) session.get(Product.class, productId);
		session.close();
		return product;
	}

	public void editProduct(Product product) {
		Session session = sessionFactory.getCurrentSession();
        session.update(product);
        session.flush();
	}

	public void deleteProduct(Product product) {
		Session session = sessionFactory.openSession();
        session.delete(product);
        session.flush();
		
	}

	

}
