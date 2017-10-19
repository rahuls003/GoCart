package com.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.demo.model.Cart;
import com.demo.model.CartItem;
import com.demo.model.Customer;
import com.demo.model.Product;
import com.demo.service.CartItemService;
import com.demo.service.CartService;
import com.demo.service.CustomerService;
import com.demo.service.ProductService;

@Controller
@RequestMapping("/rest/cart")
public class CartResources {

	@Autowired
	private CartService cs;

	@Autowired
	private CartItemService cartItemService;

	@Autowired
	private CustomerService customerService;

	@Autowired
	private ProductService productService;

	@RequestMapping("/{cartId}")
	public @ResponseBody Cart getCartById(@PathVariable(value = "cartId") int cartId) {
		return cs.getCartById(cartId);
	}

	/*To Add a Product to CART*/	
	
	@RequestMapping(value = "/add/{productId}", method = RequestMethod.POST)
	@ResponseStatus(value = HttpStatus.NO_CONTENT)
	public void addItem(@PathVariable(value = "productId") int productId) {
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		System.out.println("Username:" +user.getUsername());
		Customer customer = customerService.getCustomerByUsername(user.getUsername());
		
		Cart cart = customer.getCart();
		System.out.println("cart value:" + cart.getCartId());
		Product product = productService.getProductById(productId);
		List<CartItem> cartItems = cart.getCartItems();

		for (int i = 0; i < cartItems.size(); i++) {
			if (product.getProductId() == cartItems.get(i).getProduct().getProductId()) {
				CartItem cartItem = cartItems.get(i);
				cartItem.setQuantity(cartItem.getQuantity() + 1);
				cartItem.setTotalPrice(product.getProductPrice() * cartItem.getQuantity());
				cartItemService.addCartItem(cartItem);
				return;
			}

		}

		CartItem cartItem = new CartItem();
		cartItem.setProduct(product);
		cartItem.setQuantity(1);
		cartItem.setTotalPrice(product.getProductPrice() * cartItem.getQuantity());
		cartItem.setCart(cart);
		cartItemService.addCartItem(cartItem);

	}

	
	/*To Delete a Single Item From Cart*/
	
	@RequestMapping(value="/remove/{cartItemId}", method = RequestMethod.PUT)
	@ResponseStatus(value = HttpStatus.NO_CONTENT)
	public void removeItem(@PathVariable int cartItemId) {
		
		System.out.println("You have entered Remove-item function :" +cartItemId);
		
		CartItem cartItem = cartItemService.getCartItem(cartItemId);
		cartItemService.removeCartItem(cartItem);
	}
	
	
	
	/* @RequestMapping(value = "/remove/{cartItemId}", method = RequestMethod.PUT)
	    @ResponseStatus(value = HttpStatus.NO_CONTENT)
	    public void removeItem(@PathVariable int cartItemId )
	{
		System.out.println("You have entered Remove-item function :" +cartItemId);
		 
		CartItem cart1 = cartItemService.getCartItemByCartItemId(cartItemId);
		System.out.println("cartItem:" +cart1);
		
		cartItemService.removeCartItem(cart1);    
	}*/

	 
	 /*To Delete whole cart*/
	 
	 @RequestMapping(value = "/{cartId}", method = RequestMethod.PUT)
	 @ResponseStatus(value = HttpStatus.NO_CONTENT)  
	  public void clearCart(@PathVariable(value = "cartId") int cartId)
	 {
	         Cart cart = cs.getCartById(cartId);
	         cartItemService.removeAllCartItems(cart);
	     
	 }

	    
		/* Why we are using this thing ?*/

	 
	 @ExceptionHandler(IllegalArgumentException.class)
	 @ResponseStatus(value = HttpStatus.BAD_REQUEST, reason = "Illegal request, please verify your payload")	     
	 public void handleClientErrors (Exception ex)
	 {
	     }
	 @ExceptionHandler(Exception.class)
	 @ResponseStatus(value = HttpStatus.INTERNAL_SERVER_ERROR, reason = "Internal Server Error")    
	 public void handleServerErrors (Exception ex){

	     }	
	
} // The End of Class;
