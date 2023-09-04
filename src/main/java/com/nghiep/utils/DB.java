package com.nghiep.utils;

import java.util.HashMap;
import java.util.List;

import com.nghiep.dao.OrderDAO;
import com.nghiep.entity.*;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;



public class DB {
	@Autowired
	OrderDAO dao;
	List<Order> list = dao.findAll();
	public static Map<Integer, Item> items = new HashMap<>();
	static {
//		items.put(1, new Item(1, "Nón bảo hiểm 3/4 kính âm màu vàng ROYAL M139", 500000, "mu.png",0));
//		items.put(2, new Item(2, "Nón bảo hiểm fullface Bell Qualifier", 500000, "mu2.png",0));
//		items.put(3, new Item(3, "Nón bảo hiểm Asia 3/4 chính hãng", 500000, "mu1.png",0));
//		items.put(4, new Item(4, "Nón bảo hiểm 1/2 + kính phi công", 500000, "mu5.png",0));
//		items.put(5, new Item(5, "Nón bảo hiểm Royal Helmet", 500000, "mu3.png",0));
//		items.put(6, new Item(6, "Nón fullface ROYAL M136 V2 ĐỎ", 500000, "mu4.png",0));
		
		
	}
}


