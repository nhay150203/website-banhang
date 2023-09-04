package com.nghiep.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.nghiep.entity.*;

public interface OrderDetailDAO extends JpaRepository<OrderDetail, Long> {
	@Query("SELECT new Report(o.product.category, sum(o.quantity), sum(o.price*o.quantity)) " + " FROM OrderDetail o " + " GROUP BY o.product.category"
			+ " ORDER BY sum(o.price*o.quantity) DESC")
	List<Report> getInventoryByCategory();
	@Query("SELECT new Report(o.product, sum(o.quantity), sum(o.price*o.quantity)) " + " FROM OrderDetail o " + " GROUP BY o.product"
			+ " ORDER BY sum(o.price*o.quantity) DESC")
	List<Report> getInventoryByProduct();
	@Query("SELECT new Report(o.order.account, count(o.order.id), sum(o.price*o.quantity)) " + " FROM OrderDetail o " + " GROUP BY o.order.account"
			+ " ORDER BY sum(o.price*o.quantity) DESC")
	List<Report> getInventoryByUser();

}