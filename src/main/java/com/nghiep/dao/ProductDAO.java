package com.nghiep.dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.nghiep.entity.*;

public interface ProductDAO extends JpaRepository<Product, Integer> {

//	@Query("SELECT o FROM Product o WHERE o.price BETWEEN ?1 AND ?2")
//	List<Product> findByPrice(double minPrice, double maxPrice);
	List<Product> findByPriceBetween(double minPrice, double maxPrice);

	@Query("SELECT o FROM Product o WHERE o.available LIKE 1")
	List<Product> findByAvailable();
	@Query("SELECT o FROM Product o WHERE o.available LIKE 1 AND o.outstanding LIKE 1")
	List<Product> findByOutstanding();
	@Query("SELECT o FROM Product o WHERE o.category.id LIKE ?1")
	List<Product> findAllByCategory(String category);
//Page<Product> findByKeywords(String keywords, Pageable pageable);

	Page<Product> findAllByNameLike(String keywords, Pageable pageable);

//	@Query("SELECT new Report(o.category, sum(o.price), count(o)) " + " FROM Product o " + " GROUP BY o.category"
//			+ " ORDER BY sum(o.price) DESC")
//	List<Report> getInventoryByCategory();
}
