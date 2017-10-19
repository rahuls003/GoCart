package com.demo.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.demo.service.CategoryService;

@Controller
public class HomeController {
	
	@Autowired
	CategoryService categoryService;
	
	
	@RequestMapping("/")
	public String homePage(HttpSession session) {
		session.setAttribute("categories", categoryService.getAllCategory());
		return "home";
	}
	
	@RequestMapping("/about")
	public String admin() {
		return "About";
	}
	

	@RequestMapping("/T&P")
	public String termsandcondition() {
		return "TermsAndConditions";
	}
	

	@RequestMapping("/login")
	public String login(
	@RequestParam(value="error", required = false)
	String error,
	@RequestParam(value="logout", required = false)
	String logout,
	Model model){
	if(error != null){
	model.addAttribute("error", "Invalid username and password");
	}
	if (logout !=null){
	model.addAttribute("msg", "You have been logged out successfully");
	}
	return "loginform";
	
	}
}
