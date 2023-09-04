package com.nghiep.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.nghiep.dao.FavoriteDAO;
import com.nghiep.dao.ProductDAO;
import com.nghiep.entity.Account;
import com.nghiep.entity.Favorite;
import com.nghiep.entity.Product;
import com.nghiep.service.SessionService;

@Controller
public class HomeController {
	@Autowired
	ProductDAO prdao;

	@RequestMapping("/home")
	public String home(Model model) {
		return "/index";
	}

	@RequestMapping("/san-pham-noi-bat")
	public String spnb(Model model) {
		List<Product> list = prdao.findByOutstanding();
		model.addAttribute("items", list);
		return "/san-pham-noi-bat";
	}
	@RequestMapping("/non-bao-hiem")
	public String nbh(Model model) {
		List<Product> list = prdao.findAllByCategory("NO");
		model.addAttribute("items", list);
		return "/non-bao-hiem";
	}
	@RequestMapping("/balo")
	public String balo(Model model) {
		List<Product> list = prdao.findAllByCategory("BA");
		model.addAttribute("items", list);
		return "/balo";
	}
	@RequestMapping("/quan-ao")
	public String qa(Model model) {
		List<Product> list = prdao.findAllByCategory("QA");
		model.addAttribute("items", list);
		return "/quan-ao";
	}
	@RequestMapping("/gang-tay")
	public String gt(Model model) {
		List<Product> list = prdao.findAllByCategory("GA");
		model.addAttribute("items", list);
		return "/gang-tay";
	}
}
