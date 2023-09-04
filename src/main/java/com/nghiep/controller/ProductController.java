package com.nghiep.controller;

import java.util.List;
import java.util.Optional;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.nghiep.dao.ProductDAO;
import com.nghiep.entity.Product;
import com.nghiep.service.SessionService;

@Controller
public class ProductController {
	@Autowired
	ProductDAO dao;
	@Autowired
	HttpServletRequest request;
	@Autowired
	ServletContext app;

	@RequestMapping("/product/list/page")
	public String init(Model model, @RequestParam("p") Optional<Integer> p,
			@RequestParam("field") Optional<String> field) {
		model.addAttribute("pageProducts", "active");
		Product product = new Product();
		model.addAttribute("product", product);
		Pageable pageable = PageRequest.of(p.orElse(0), 5, Sort.by(Direction.ASC, field.orElse("id")));
		Page<Product> page = dao.findAll(pageable);
		model.addAttribute("page", page);
		int maxPage = (int) Math.ceil(page.getTotalElements() / (double) 5);
		model.addAttribute("maxPage", maxPage);
		model.addAttribute("tabList", "active");
		model.addAttribute("showList", "show active");
		model.addAttribute("tabEdit", "");
		model.addAttribute("showEdit", "");
		return "/productsManagement";
	}

	@RequestMapping("/product/edit/{id}")
	public String edit(Model model, @PathVariable("id") int id) {
		model.addAttribute("pageProducts", "active");
		Product product = dao.findById(id).get();
		model.addAttribute("product", product);
		model.addAttribute("imageProduct", product.getImage());
		model.addAttribute("tabList", "");
		model.addAttribute("showList", "");
		model.addAttribute("tabEdit", "active");
		model.addAttribute("showEdit", "show active");
		return "/productsManagement";
	}

	@RequestMapping("/product/edit")
	public String edit(Model model) {
		Product product = new Product();
		model.addAttribute("pageProducts", "active");
		model.addAttribute("product", product);
		model.addAttribute("tabList", "");
		model.addAttribute("showList", "");
		model.addAttribute("tabEdit", "active");
		model.addAttribute("showEdit", "show active");
		return "/productsManagement";
	}

	@RequestMapping("/product/setImage/{id}")
	public String setImage(Model model, @RequestParam("attach") MultipartFile image, @PathVariable("id") int id) {
		Product product = new Product();
		if(id != 0) {
			product = dao.findById(id).get();
		}
		model.addAttribute("product", product);
		if (!image.isEmpty()) {
			String fileName = image.getOriginalFilename();
			model.addAttribute("imageProduct", fileName);
			product.setImage(fileName);
		}
		model.addAttribute("pageProducts", "active");
		model.addAttribute("tabList", "");
		model.addAttribute("showList", "");
		model.addAttribute("tabEdit", "active");
		model.addAttribute("showEdit", "show active");
		return "/productsManagement";
	}

	@RequestMapping("/product/create")
	public String create(Product product) {
		dao.save(product);
		return "redirect:/product/list/page";
	}

	@RequestMapping("/product/update")
	public String update(Product product) {
		dao.save(product);
		return "redirect:/product/edit/" + product.getId();
	}

	@RequestMapping("/product/delete/{id}")
	public String delete(@PathVariable("id") int id) {
		dao.deleteById(id);
		return "redirect:/product/list/page";
	}
//	
//	@RequestMapping("/product/search")
//	public String search(Model model, 
//			@RequestParam("min") Optional<Double> min,
//			@RequestParam("max") Optional<Double> max) {
//		double minPrice = min.orElse(Double.MIN_VALUE);
//		double maxPrice = max.orElse(Double.MAX_VALUE);
//		//List<Product> items = dao.findByPrice(minPrice, maxPrice); //lab6.1
//		List<Product> items = dao.findByPriceBetween(minPrice, maxPrice); //lab6.4
//		model.addAttribute("items", items);
//		return "product/search";
//	}

	@Autowired
	SessionService session;

	@RequestMapping("/product/search")
	public String searchAndPage(Model model, @RequestParam("keywords") Optional<String> kw,
			@RequestParam("p") Optional<Integer> p) {
		model.addAttribute("pageProducts", "active");
		Product product = new Product();
		model.addAttribute("product", product);
		String kwords = kw.orElse(session.get("keywords", ""));
		session.set("keywords", kwords);
		Pageable pageable = PageRequest.of(p.orElse(0), 5);
		// Page<Product> page = dao.findByKeywords("%"+kwords+"%", pageable); //lab6.3
		Page<Product> page = dao.findAllByNameLike("%" + kwords + "%", pageable); // lab6.5
		model.addAttribute("page", page);
		int maxPage = (int) Math.ceil(page.getTotalElements() / (double) 5);
		model.addAttribute("maxPage", maxPage);
		model.addAttribute("tabList", "active");
		model.addAttribute("showList", "show active");
		model.addAttribute("tabEdit", "");
		model.addAttribute("showEdit", "");
		return "/productsManagement";
	}

}
