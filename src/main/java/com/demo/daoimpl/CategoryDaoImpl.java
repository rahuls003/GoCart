package com.demo.daoimpl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.demo.dao.CategoryDao;
import com.demo.model.Category;

@Repository
@Transactional
public class CategoryDaoImpl implements CategoryDao{

	@Autowired
	private SessionFactory sessionFactory;

	public void addCategory(Category category) {
		Session session = sessionFactory.openSession();
		session.saveOrUpdate(category);
		session.flush();
		session.close();
		
	}

	public List<Category> getAllCategory() {
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("from Category");
		List<Category> category = query.list();
		session.close();
		return category;
	}

	public void deleteCategory(int categoryId) {
		Session session = sessionFactory.openSession();
		Category categories = (Category) session.get(Category.class, categoryId);
		session.delete(categories);
		session.flush();
		session.close();
	}

	public void editCategory(Category category) {
		Session session = sessionFactory.openSession();
		session.update(category);
		session.flush();
		session.close();
	}

	public Category getByName(String categoryName) {
		String hql="from Category where categoryDescription=?";
        Query query=sessionFactory.openSession().createQuery(hql);
        query.setString(0, categoryName);
        @SuppressWarnings("unchecked")
        List<Category> listCategory=(List<Category>) query.list();
        if (listCategory != null && !listCategory.isEmpty()) {
              return listCategory.get(0);
        }
        else
        {
              return null;
        }
	}

	public Category getCategoryById(int categoryId) {
		Session session = sessionFactory.openSession();
		Category category = (Category) session.get(Category.class, categoryId);
		session.close();
		return category;
	}
}
