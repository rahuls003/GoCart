package com.demo.service;

import com.demo.model.Cart;
import com.demo.model.CartItem;

public interface CartItemService {

	void addCartItem(CartItem cartItem);

    void removeCartItem(CartItem cartItem);

    void removeAllCartItems(Cart cart);

    CartItem getCartItem(int cartItemId);
}
