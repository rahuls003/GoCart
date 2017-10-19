package com.demo.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.dao.SupplierDao;
import com.demo.model.Supplier;
import com.demo.service.SupplierService;

@Service
public class SupplierServiceImpl implements SupplierService {

	@Autowired
	private SupplierDao supplierDao;

	public void addSupplier(Supplier supplier) {
		supplierDao.addSupplier(supplier);
		
	}

	public List<Supplier> getAllSupplier() {
		return supplierDao.getAllSupplier();
	}

	public Supplier getSupplierById(int supplierId) {
		return supplierDao.getSupplierById(supplierId);
	}

	public void deleteSupplier(int supplierId) {
		supplierDao.deleteSupplier(supplierId);
	}

	public Supplier getByName(String supplierName) {
		return supplierDao.getByName(supplierName);
	}

	public void editSupplier(Supplier supplier) {
		supplierDao.editSupplier(supplier);
	}
}
