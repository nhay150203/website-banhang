package com.nghiep.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.nghiep.dao.FavoriteDAO;
import com.nghiep.dao.OrderDAO;
import com.nghiep.dao.OrderDetailDAO;
import com.nghiep.dao.ProductDAO;
import com.nghiep.entity.*;
import com.nghiep.service.SessionService;
import com.nghiep.service.ShoppingCartService;

@Controller
public class ShoppingCartController {
	@Autowired
	ShoppingCartService cart; // 1. tiêm Spring Bean đã viết ở bài trước
	@Autowired
	ProductDAO prdao;
	@Autowired
	FavoriteDAO fvdao;
	@Autowired
	OrderDAO orderdao;
	@Autowired
	OrderDetailDAO orderdetaildao;
	@Autowired
	SessionService session;
	private Favorite item;

	// 2. xem giỏ hàng
	@RequestMapping("/shopping-cart")
	public String view(Model model) {
		Account acc = session.get("user");
		String username = acc.getUsername();
		List<Favorite> list = fvdao.findByUser(username);
		session.set("badge", list.size());
		model.addAttribute("list", prdao.findByAvailable());
		if (list.size() != 0) {			
			model.addAttribute("items", list);
		} else {
			model.addAttribute("disabled", 1);
		}
		return "/shopping-cart"; // 3. view lên trang giỏ hảng index
	}

	///////////////////////////////////

	@RequestMapping("/cart/add/{id}")
	public String add(@PathVariable("id") int id) {
		Product product = prdao.findById(id).get();
		Account acc = session.get("user");
		item = fvdao.findByProduct(id, acc.getUsername());
		if (item == null) {
			item = new Favorite();
			item.setAccount(session.get("user"));
			item.setProduct(product);
			item.setQuantity(1);
			item.setLikedate(new Date());
			item.setPrice(product.getPrice());
			fvdao.save(item);
		} else {
			item.setQuantity(item.getQuantity() + 1);
			fvdao.save(item);
		}
		return "redirect:/shopping-cart"; // hiển thị giỏ hàng
	}

	@RequestMapping("/cart/remove/{id}")
	public String remove(@PathVariable("id") int id) {
		fvdao.deleteById(id);
		return "redirect:/shopping-cart";
	}

	@RequestMapping("/cart/update/{id}")
	public String update(@PathVariable("id") int id, @RequestParam("quantity") Integer qty) {
		item = fvdao.findById(id).get();
		item.setQuantity(qty);
		fvdao.save(item);
		return "redirect:/shopping-cart";
	}

	@RequestMapping("/cart/clear")
	public String clear() {
		fvdao.deleteAll();
		return "redirect:/shopping-cart";
	}

	@RequestMapping("/cart/check")
	public String check(Model model) {
		Account acc = session.get("user");
		String username = acc.getUsername();
		model.addAttribute("list", fvdao.findByUser(username));
		double sum = 0;
		for (Favorite f : fvdao.findByUser(username)) {
			sum += (f.getPrice() * f.getQuantity());
		}
		model.addAttribute("sum", sum);
		return "/pay";
	}

	@RequestMapping("/cart/order")
	public String order(Model model, @RequestParam("address") String address) {
		Account acc = session.get("user");
		String username = acc.getUsername();
		model.addAttribute("list", fvdao.findByUser(username));
		double sum = 0;
		for (Favorite f : fvdao.findByUser(username)) {
			sum += (f.getPrice() * f.getQuantity());
		}
		model.addAttribute("sum", sum);
		Order od = new Order();
		od.setAccount(acc);
		od.setCreateDate(new Date());
		od.setAddress(address);
		List<OrderDetail> details = new ArrayList<>();
		for (Favorite f : fvdao.findByUser(username)) {
			OrderDetail odd = new OrderDetail();
			odd.setOrder(od);
			odd.setProduct(f.getProduct());
			odd.setQuantity(f.getQuantity());
			odd.setPrice(f.getPrice());
			details.add(odd);
			fvdao.deleteById(f.getId());
		}
		od.setOrderDetails(details);
		orderdao.save(od);
		for (OrderDetail o : details) {
			orderdetaildao.save(o);
		}
		return "redirect:/shopping-cart";
	}
}
