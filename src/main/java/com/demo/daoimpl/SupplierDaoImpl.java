package com.demo.daoimpl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.demo.dao.SupplierDao;
import com.demo.model.Supplier;

@Repository
@Transactional
public class SupplierDaoImpl implements SupplierDao{

	@Autowired
	private SessionFactory sessionFactory;

	public void addSupplier(Supplier supplier) {
		Session session = sessionFactory.openSession();
		session.saveOrUpdate(supplier);
		session.flush();
		session.close();
		
	}

	public List<Supplier> getAllSupplier() {
		Session session=sessionFactory.openSession();
		Query query=session.createQuery("from Supplier");
		List<Supplier> supplier=query.list();
		session.close();
		return supplier;
	}

	public Supplier getSupplierById(int supplierId) {
		Session session = sessionFactory.openSession();
		Supplier supplier = (Supplier) session.get(Supplier.class, supplierId);
		session.close();
		return supplier;
	}

	public void deleteSupplier(int supplierId) {
		Session session = sessionFactory.openSession();
		Supplier supplier = (Supplier) session.get(Supplier.class, supplierId);
		session.delete(supplier);
		session.flush();
		session.close();
		
	}

	public Supplier getByName(String supplierName) {
		String hql="from Supplier where supplierName=?";
        Query query=sessionFactory.openSession().createQuery(hql);
        query.setString(0, supplierName);

        @SuppressWarnings("unchecked")
        List<Supplier> listSupplier=(List<Supplier>) query.list();
        if(listSupplier!=null && !listSupplier.isEmpty()){
              return listSupplier.get(0);
        }
        else{
              return null;
        }
	}

	public void editSupplier(Supplier supplier) {
		Session session = sessionFactory.openSession();
		session.update(supplier);
		session.flush();
		session.close();
	}
}
