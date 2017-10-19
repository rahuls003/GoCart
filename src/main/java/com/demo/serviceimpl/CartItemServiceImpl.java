package com.demo.serviceimpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.demo.dao.CartItemDao;
import com.demo.model.Cart;
import com.demo.model.CartItem;
import com.demo.service.CartItemService;

@Service
public class CartItemServiceImpl implements CartItemService {

	@Autowired
	private CartItemDao cid;
	
	public void addCartItem(CartItem cartItem) {
		cid.addCartItem(cartItem);
	}

	public void removeCartItem(CartItem cartItem) {
		cid.removeCartItem(cartItem);
	}
	
	public void removeAllCartItems(Cart cart) {
		cid.removeAllCartItems(cart);
	}

	public CartItem getCartItem(int cartItemId) {
		return cid.getCartItem(cartItemId);
	}

	

	
}


