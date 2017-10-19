package com.demo.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.dao.CategoryDao;
import com.demo.model.Category;
import com.demo.service.CategoryService;

@Service
public class CategoryServiceImpl implements CategoryService{

	@Autowired
	private CategoryDao categoryDao;

	public void addCategory(Category category) 
	{
		categoryDao.addCategory(category);
		
	}

	public List<Category> getAllCategory() 
	{
		return categoryDao.getAllCategory();
	}

	public void deleteCategory(int categoryId) {
		categoryDao.deleteCategory(categoryId);
	}

	public void editCategory(Category category) {
		categoryDao.editCategory(category);
	}

	public Category getByName(String categoryName) {
		return categoryDao.getByName(categoryName);
	}

	public Category getCategoryById(int categoryId) {
		return categoryDao.getCategoryById(categoryId);
	}
}
