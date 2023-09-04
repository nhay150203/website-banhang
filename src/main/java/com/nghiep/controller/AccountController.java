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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.nghiep.dao.AccountDAO;
import com.nghiep.dao.FavoriteDAO;
import com.nghiep.entity.Account;
import com.nghiep.entity.Favorite;
import com.nghiep.entity.Product;
import com.nghiep.service.CookieService;
import com.nghiep.service.ParamService;
import com.nghiep.service.SessionService;

@Controller
public class AccountController {
	@Autowired
	CookieService cookieService;
	@Autowired
	ParamService paramService;
	@Autowired
	SessionService sessionService;
	@Autowired
	AccountDAO accdao;
	@Autowired
	HttpServletRequest request;
	@Autowired
	ServletContext app;
	@Autowired
	FavoriteDAO fvdao;

	@RequestMapping("/logout")
	public String logout() {
		sessionService.remove("user");
		sessionService.set("badge", "0");
		return "/login";
	}
	@GetMapping("/login")
	public String init() {
		sessionService.remove("user");
		sessionService.set("badge", "0");
		return "/login";
	}

	@PostMapping("/login")
	public String login(Model model) {
		String username = paramService.getString("username", "");
		String password = paramService.getString("password", "");
		boolean remember = paramService.getBoolean("remember", false);
		try {
			Account acc = accdao.findById(username).get();
			if (acc.isActivated()) {
				if (password.equals(acc.getPassword())) {
					sessionService.set("user", acc);
					String user = acc.getUsername();
					List<Favorite> list = fvdao.findByUser(user);
					sessionService.set("badge", list.size());
					if (remember) {
						cookieService.add("user", username, 240);
						cookieService.add("pass", password, 240);
						System.out.println("Them cookie thanh cong");
					} else {
						cookieService.remove("user");
						cookieService.remove("pass");
					}
					System.out.println("Dang nhap thanh cong");
					return "/index";
				} else {
					model.addAttribute("message", "Sai mật khẩu!");
				}
			} else {
				model.addAttribute("message", "Sai tên tài khoản!");
			}

		} catch (Exception e) {
			model.addAttribute("message", "Sai tên tài khoản!");
		}

		return "/login";
	}

	@GetMapping("/register")
	public String signup() {
		return "/register";
	}

	@PostMapping("/register")
	public String addAcount(Account acc) {
		accdao.save(acc);
		return "/index";
	}
	@RequestMapping("/account/list/page")
	public String init(Model model, @RequestParam("p") Optional<Integer> p,
			@RequestParam("field") Optional<String> field) {
		model.addAttribute("pageUsers", "active");
		Account acc = new Account();
		model.addAttribute("account", acc);
		Pageable pageable = PageRequest.of(p.orElse(0), 5, Sort.by(Direction.ASC, field.orElse("username")));
		Page<Account> page = accdao.findAll(pageable);
		model.addAttribute("page", page);
		int maxPage = (int) Math.ceil(page.getTotalElements() / (double) 5);
		model.addAttribute("maxPage", maxPage);
		model.addAttribute("tabList", "active");
		model.addAttribute("showList", "show active");
		model.addAttribute("tabEdit", "");
		model.addAttribute("showEdit", "");
		return "/userManagement";
	}

	@RequestMapping("/account/edit/{username}")
	public String edit(Model model, @PathVariable("username") String username) {
		model.addAttribute("pageUsers", "active");
		Account acc = accdao.findById(username).get();
		model.addAttribute("account", acc);
		model.addAttribute("photo", acc.getPhoto());
		model.addAttribute("tabList", "");
		model.addAttribute("showList", "");
		model.addAttribute("tabEdit", "active");
		model.addAttribute("showEdit", "show active");
		return "/userManagement";
	}

	@RequestMapping("/account/edit")
	public String edit(Model model) {
		Account acc = new Account();
		model.addAttribute("pageUsers", "active");
		model.addAttribute("account", acc);
		model.addAttribute("tabList", "");
		model.addAttribute("showList", "");
		model.addAttribute("tabEdit", "active");
		model.addAttribute("showEdit", "show active");
		return "/userManagement";
	}

	@RequestMapping("/account/setPhoto/{id}")
	public String setImage(Model model, @RequestParam("attach") MultipartFile image, @PathVariable("username") String username) {
		Account acc = new Account();
		if(!username.isEmpty()) {
			acc = accdao.findById(username).get();
		}
		model.addAttribute("account", acc);
		if (!image.isEmpty()) {
			String fileName = image.getOriginalFilename();
			model.addAttribute("photo", fileName);
			acc.setPhoto(fileName);
		}
		model.addAttribute("pageUsers", "active");
		model.addAttribute("tabList", "");
		model.addAttribute("showList", "");
		model.addAttribute("tabEdit", "active");
		model.addAttribute("showEdit", "show active");
		return "/userManagement";
	}

	@RequestMapping("/account/add")
	public String create(Account acc) {
		accdao.save(acc);
		return "redirect:/account/list/page";
	}

	@RequestMapping("/account/update")
	public String update(Account acc) {
		accdao.save(acc);
		return "redirect:/account/edit/" + acc.getUsername();
	}

	@RequestMapping("/account/delete/{username}")
	public String delete(@PathVariable("username") String username) {
		accdao.deleteById(username);
		return "redirect:/account/list/page";
	}
//	@RequestMapping("/account/search")
//	public String searchAndPage(Model model, @RequestParam("keyword") Optional<String> kw,
//			@RequestParam("p") Optional<Integer> p) {
//		model.addAttribute("pageUsers", "active");
//		Account acc = new Account();
//		model.addAttribute("account", acc);
//		String kwords = kw.orElse(session.get("keyword", ""));
//		session.set("keyword", kwords);
//		Pageable pageable = PageRequest.of(p.orElse(0), 5);
//		// Page<Product> page = dao.findByKeywords("%"+kwords+"%", pageable); //lab6.3
//		Page<Account> page = accdao.findAllByNameLike("%" + kwords + "%", pageable); // lab6.5
//		model.addAttribute("page", page);
//		int maxPage = (int) Math.ceil(page.getTotalElements() / (double) 5);
//		model.addAttribute("maxPage", maxPage);
//		model.addAttribute("tabList", "active");
//		model.addAttribute("showList", "show active");
//		model.addAttribute("tabEdit", "");
//		model.addAttribute("showEdit", "");
//		return "/userManagement";
//	}

}
