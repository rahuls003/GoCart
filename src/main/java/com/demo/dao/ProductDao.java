package com.demo.dao;

import java.util.List;

import com.demo.model.Product;

public interface ProductDao {
	
    void addProduct(Product product);
    
    public List<Product> getAllProduct();
    
    public Product getProductById(int productId );
    
    public void editProduct(Product product);

    void deleteProduct(Product product);
}
