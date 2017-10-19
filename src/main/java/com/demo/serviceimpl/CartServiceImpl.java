package com.demo.serviceimpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.dao.CartDao;
import com.demo.model.Cart;
import com.demo.service.CartService;

@Service
public class CartServiceImpl implements CartService{

	@Autowired
	private CartDao cd;

	public Cart getCartById(int cartId) {
		return cd.getCartById(cartId);
	}
	
}
