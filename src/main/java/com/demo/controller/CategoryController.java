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
import com.demo.service.CategoryService;

@Controller
@RequestMapping("/category")
public class CategoryController {

	 @Autowired
	    private CategoryService categoryService;
	 
	 @RequestMapping("/allCategory")
		public String getAllCategory(Model model)
		{
			List<Category> l =categoryService.getAllCategory();
			model.addAttribute("category", l);
			return "CategoryManagement";
			
		}
	 
	 @RequestMapping("/addCategory")
	    public String addCategory(Model model){
		 Category category = new Category();
	        model.addAttribute("category", category);

	        return "addCategory";
	    }

	    @RequestMapping(value="/addCategory1", method = RequestMethod.POST)
	    public String addCategoryPost(@Valid @ModelAttribute("category") Category category, BindingResult result, HttpServletRequest request){

	        if(result.hasErrors()){
	            return "addCategory";
	        }
	        categoryService.addCategory(category);
	        return "redirect:/category/allCategory";
	    }
	    
	    
	    @RequestMapping("/deleteCategory/{categoryId}")
		public String deleteCategory(@PathVariable int categoryId)
		{
	    	categoryService.deleteCategory(categoryId);
			return "redirect:/category/allCategory";
		}
		
		@RequestMapping("/editCategory/{categoryId}")
		public String editCategoryForm(@PathVariable int categoryId ,Model model)
		{
			model.addAttribute("category1",categoryService.getCategoryById(categoryId));
			return "editCategory";
		}
		
		@RequestMapping(value="/editCategory/{categoryId}", method = RequestMethod.POST)
	    public String editCategoryDetails(@Valid @ModelAttribute("category1") Category category, BindingResult result, HttpServletRequest request)
		{
	 
	        if(result.hasErrors()){
	            return "redirect:/editCategory";
	        }
	 
	        categoryService.addCategory(category);

	        return "redirect:/category/allCategory";
		}
	    
}//End of Function.
