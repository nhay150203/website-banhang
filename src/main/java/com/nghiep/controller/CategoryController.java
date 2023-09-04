package com.nghiep.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.nghiep.dao.CategoryDAO;
import com.nghiep.entity.Category;

@Controller
public class CategoryController {
	@Autowired
	CategoryDAO dao; // làm việc với bảng Categories

	@RequestMapping("/category/list")
	public String index(Model model) {
		model.addAttribute("pageCategorys", "active");
		Category item = new Category();
		model.addAttribute("item", item);
		List<Category> items = dao.findAll();
		model.addAttribute("items", items);
		return "categorysManagement";
	}

	@RequestMapping("/category/edit/{id}")
	public String edit(Model model, @PathVariable("id") String id) {
		model.addAttribute("pageCategorys", "active");
		Category item = dao.findById(id).get();
		model.addAttribute("item", item);
		List<Category> items = dao.findAll();
		model.addAttribute("items", items);
		return "categorysManagement";
	}

	@RequestMapping("/category/create")
	public String create(Category item) {
		dao.save(item);
		return "redirect:/category/list";
	}

	@RequestMapping("/category/update")
	public String update(Category item) {
		dao.save(item);
		return "redirect:/category/edit/" + item.getId();
	}

	@RequestMapping("/category/delete/{id}")
	public String delete(@PathVariable("id") String id) {
		dao.deleteById(id);
		return "redirect:/category/list";
	}
}
