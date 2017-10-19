package com.demo.service;

import java.util.List;

import com.demo.model.Category;

public interface CategoryService {

	void addCategory(Category category);
	
	public List<Category> getAllCategory();
	
	public Category getCategoryById(int categoryId);
	
	public void deleteCategory(int categoryId);

	public void editCategory(Category category);

	public Category getByName(String categoryName);
}
