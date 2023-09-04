package com.nghiep.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.nghiep.entity.*;

public interface OrderDAO extends JpaRepository<Order, Long>{
}
