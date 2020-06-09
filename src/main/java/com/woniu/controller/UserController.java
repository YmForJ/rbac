package com.woniu.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.woniu.entity.User;
import com.woniu.service.UserService;

@Controller
@RequestMapping("user")
public class UserController {
	@Autowired
	UserService userService;

	@RequestMapping("list")
	public String list(Model model, HttpSession session) {
		if (session.getAttribute("user") != null) {
			List<User> userList = userService.findAll();
			model.addAttribute(userList);
			return "user/user_list";
		}
		model.addAttribute("msg", "请先登录");
		return "login";
	}

	@RequestMapping("add")
	public String add(Model model, HttpSession session) {
		if (session.getAttribute("user") != null) {
			return "user/user_add";
		}
		model.addAttribute("msg", "请先登录");
		return "login";
	}

	@RequestMapping("addDo")
	public String addDo(Model model, HttpSession session, User user) {
		if (session.getAttribute("user") != null) {
			try {
				userService.save(user);
				return "redirect:list";
			} catch (Exception e) {
				e.printStackTrace();
				return "redirect:add";
			}
		}
		model.addAttribute("msg", "请先登录");
		return "login";
	}

	@RequestMapping("deleteDo")
	@ResponseBody
	public Model deleteDo(Model model, HttpSession session, Integer[] uid) {
		if (session.getAttribute("user") != null) {
			try {
				userService.delete(uid);
				model.addAttribute("msg", "ok");
			} catch (Exception e) {
				e.printStackTrace();
				model.addAttribute("msg", "系统维护中");
			}
		}
		model.addAttribute("msg", "删除失败");
		return model;
	}

}
