package com.demo.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.dao.ProductDao;
import com.demo.model.Product;
import com.demo.service.ProductService;

@Service
public class ProductServiceImpl implements ProductService {
	@Autowired
	private ProductDao productDao;
	
	public void addProduct(Product product) {
		productDao.addProduct(product);
		
	}
	public List<Product> getAllProduct() {
		return productDao.getAllProduct();
	}
	public Product getProductById(int productId) {
		return productDao.getProductById(productId);
	}
	public void editProduct(Product product) {
		productDao.editProduct(product);
	}
	public void deleteProduct(Product product) {
		productDao.deleteProduct(product);
	}

}
