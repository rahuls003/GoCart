package com.demo.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.demo.service.CustomerService;
import com.demo.model.Customer;

@Controller
public class CustomerController {

	@Autowired
	CustomerService customerService;
	
	@RequestMapping("/allCustomer")
	public String getAllCustomer(Model model)
	{
		List<Customer> l =customerService.getAllCustomer();
		model.addAttribute("customer", l);
		return "CustomerManagement";
	}
	
	@RequestMapping("/signup")
	public String getCustomerForm(Model model)
	{
		
		model.addAttribute("customer",new Customer());
		return "signup";
	}
		
	@RequestMapping(value="/addCustomer", method = RequestMethod.POST)
    public String addCustomerDetails(String empty1,Model model,@Valid @ModelAttribute("customer") Customer customer, BindingResult result, HttpServletRequest request)
	{
		if(empty1 == null){
			model.addAttribute("empty1", "this field must not be empty");
			 return "redirect:/signup";
			}
		 if(result.hasErrors()){
	            return "redirect:/signup";
	        }
		 
		 customerService.addCustomer(customer);
			
	        return "redirect:/";
		}
}
