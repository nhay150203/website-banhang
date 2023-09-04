package com.nghiep.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.nghiep.dao.OrderDetailDAO;
import com.nghiep.entity.Report;

@Controller
public class ReportController {
	@Autowired
	OrderDetailDAO orderDetailDAO;
	@RequestMapping("/report")
	public String report(Model model) {
		List<Report> list = orderDetailDAO.getInventoryByCategory();
		model.addAttribute("list1", list);
		model.addAttribute("tab1", "active");
		model.addAttribute("show1", "show active");
		model.addAttribute("pageReports", "active");
		return "/report";
	}
	@RequestMapping("/report1")
	public String report1(Model model) {
		List<Report> list = orderDetailDAO.getInventoryByUser();
		model.addAttribute("list2", list);
		model.addAttribute("tab2", "active");
		model.addAttribute("show2", "show active");
		model.addAttribute("pageReports", "active");
		return "/report";
	}
	@RequestMapping("/report2")
	public String report2(Model model) {
		List<Report> list = orderDetailDAO.getInventoryByProduct();
		model.addAttribute("list3", list);
		model.addAttribute("tab3", "active");
		model.addAttribute("show3", "show active");
		model.addAttribute("pageReports", "active");
		return "/report";
	}
}
