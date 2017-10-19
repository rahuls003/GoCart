package com.demo.daoimpl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.demo.dao.CartItemDao;
import com.demo.model.Cart;
import com.demo.model.CartItem;

@Repository
@Transactional
public class CartItemDaoImpl implements CartItemDao {

	@Autowired
	private SessionFactory sessionFactory;
	
	public void addCartItem(CartItem cartItem) {
		Session session = sessionFactory.openSession();
		session.saveOrUpdate(cartItem);
        session.flush();
	}

	public void removeCartItem(CartItem cartItem) {
		Session session = sessionFactory.openSession();
		session.delete(cartItem);
        session.flush();
        session.close();
	}

	
	public void removeAllCartItems(Cart cart) {
		List<CartItem> cartItems = cart.getCartItems();
        for (CartItem item : cartItems){
            removeCartItem(item);
        }	
	}

	public CartItem getCartItem(int cartItemId) {
		Session session=sessionFactory.openSession();
		CartItem cartItem=(CartItem)session.get(CartItem.class, cartItemId);
		session.flush();
		session.close();
		return cartItem;
	}

   

	

}
