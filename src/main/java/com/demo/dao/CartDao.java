package com.demo.dao;

import java.io.IOException;

import com.demo.model.Cart;

public interface CartDao {
    
	Cart getCartById(int cartId);

	Cart validate(int cartId) throws IOException;

    void update(Cart cart);
}