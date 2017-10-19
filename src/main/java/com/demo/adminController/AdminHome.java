package com.demo.adminController;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.demo.model.Category;
import com.demo.model.Customer;
import com.demo.model.Product;
import com.demo.model.Supplier;
import com.demo.service.CategoryService;
import com.demo.service.CustomerService;
import com.demo.service.ProductService;
import com.demo.service.SupplierService;

@Controller
public class AdminHome 
{

	    @Autowired
	    private ProductService productService;

	    @Autowired
	    private CustomerService customerService;

	    @Autowired
	    private SupplierService supplierService;
	    
	    @Autowired
	    private CategoryService categoryService;
	    
	
	    @RequestMapping("/admin")
	    public String adminPage(){
	        return "admin";
	    }
	 
	 @RequestMapping("/admin/productInventory")
	    public String productInventory(Model model){
	        List<Product> products = productService.getAllProduct();
	        model.addAttribute("product", products);

	        return "ProductInventory";
	    }

	    @RequestMapping("/admin/customer")
	    public String customerManagerment(Model model){

	        List<Customer> customers = customerService.getAllCustomer();
	        model.addAttribute("customer", customers);

	        return "CustomerManagement";
	    }
	    
	    @RequestMapping("/admin/supplier")
	    public String supplerManagerment(Model model){

	        List<Supplier> suppliers = supplierService.getAllSupplier();
	        model.addAttribute("supplier", suppliers);

	        return "SupplierManagement";
	    }
	    
	    @RequestMapping("/admin/category")
	    public String categoryManagerment(Model model){

	        List<Category> category = categoryService.getAllCategory();
	        model.addAttribute("category", category);

	        return "CategoryManagement";
	    }

	 
	 
}
