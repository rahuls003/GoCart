package com.demo.dao;

import java.util.List;
import com.demo.model.Supplier;

public interface SupplierDao {

	void addSupplier(Supplier supplier);

	public List<Supplier> getAllSupplier();

	public Supplier getSupplierById(int supplierId);

	public void deleteSupplier(int supplierId);

	public Supplier getByName(String supplierName);

	public void editSupplier(Supplier supplier);
}
