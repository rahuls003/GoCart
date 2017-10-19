package com.demo.service;

import java.util.List;

import com.demo.model.Product;

public interface ProductService {
	
    void addProduct(Product product);
    
    public List<Product> getAllProduct();
    
    public Product getProductById(int productId );
    
    public void editProduct(Product product);

    void deleteProduct(Product product);
}
