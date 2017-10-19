package com.demo.dao;

import java.util.List;

import com.demo.model.Category;

public interface CategoryDao {

	void addCategory(Category category);
	
	public List<Category> getAllCategory();
	
	public Category getCategoryById(int categoryId);
	
	public void deleteCategory(int categoryId);

	public void editCategory(Category category);

	public Category getByName(String categoryName);
}
