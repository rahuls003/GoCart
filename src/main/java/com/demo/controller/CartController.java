package com.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.web.bind.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.demo.model.Cart;
import com.demo.model.Customer;
import com.demo.service.CartService;
import com.demo.service.CustomerService;

@Controller
@RequestMapping("/customer")
public class CartController {
	
	@Autowired
	private CartService cartService;
	
	@Autowired
	private CustomerService customerService;
	
	
	@RequestMapping("/cart/getCartId" )
	public String getCartId(Model model) {
		System.out.println("HELLO WORLD"); //for method checking purposes.
		User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		System.out.println("HELLO WORLD");
		String username = user.getUsername();
		System.out.println("HELLO WORLD");
		Customer customer = customerService.getCustomerByUsername(username);
		System.out.println("HELLO WORLD");
		Cart cart = customer.getCart();
		System.out.println("HELLO WORLD");
		int cartId = cart.getCartId();
		System.out.println("cartId:"+cartId);
		System.out.println("cart id in (function) CartController is"+cartId );
		model.addAttribute("cartId", cartId);
		return "Cart";
	}

	/*@RequestMapping("/cart/getCartId/{cartId}")
	public Cart getCartRedirect(@PathVariable int cartId) {
		System.out.println("cart id in CartController is" + cartId);
		Cart cart=cartService.getCartById(cartId);
		return cart;
	}*/

	
}//End of Class.	
	

