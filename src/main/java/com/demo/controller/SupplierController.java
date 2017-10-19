package com.demo.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.demo.model.Category;
import com.demo.model.Supplier;
import com.demo.service.SupplierService;

@Controller
@RequestMapping("/supplier")
public class SupplierController {

	 @Autowired
	    private SupplierService supplierService;
	 
	 @RequestMapping("/allSupplier")
		public String getAllCategory(Model model)
		{
			List<Supplier> l =supplierService.getAllSupplier();
			model.addAttribute("supplier", l);
			return "SupplierManagement";
			
		}
	 
	 
	 @RequestMapping("/addSupplier")
	    public String addSupplier(Model model){
		 Supplier supplier = new Supplier();
	        model.addAttribute("supplier", supplier);

	        return "addSupplier";
	    }

	    @RequestMapping(value="/addSupplier1", method = RequestMethod.POST)
	    public String addProductPost(@Valid @ModelAttribute("supplier") Supplier supplier, BindingResult result, HttpServletRequest request){

	        if(result.hasErrors()){
	            return "addSupplier";
	        }
	        supplierService.addSupplier(supplier);
	        return "redirect:/supplier/allSupplier";
	    }
	    
	    @RequestMapping("/deleteSupplier/{supplierId}")
		public String deleteSupplier(@PathVariable int supplierId)
		{
	    	supplierService.deleteSupplier(supplierId);
			return "redirect:/supplier/allSupplier";
		}
		
		
		@RequestMapping("/editSupplier/{supplierId}")
		public String editSupplierForm(@PathVariable int supplierId ,Model model)
		{
			model.addAttribute("supplier1",supplierService.getSupplierById(supplierId));
			return "editSupplier";
		}
		
		@RequestMapping(value="/editSupplier/{supplierId}", method = RequestMethod.POST)
	    public String editSupplierDetails(@Valid @ModelAttribute("supplier1") Supplier supplier, BindingResult result, HttpServletRequest request)
		{
	 
	        if(result.hasErrors()){
	            return "redirect:/editSupplier";
	        }
	 
	        supplierService.addSupplier(supplier);

	        return "redirect:/supplier/allSupplier";
		}
	    
}//end of function.
