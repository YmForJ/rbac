package com.woniu.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.woniu.entity.User;
import com.woniu.service.UserService;

@Controller
public class LogController {
	@Autowired
	UserService userService;

	@RequestMapping("login")
	public String login(User user, Model model, HttpSession session) {
		User result = userService.login(user);
		if (result != null) {
			session.setAttribute("user", result);
			return "index";
		}

		model.addAttribute("msg", "账号/密码错误");
		return "login";
	}

	@RequestMapping("logout")
	public String logout(HttpSession session, Model model) {
		session.invalidate();
		model.addAttribute("msg", "退出登录成功");
		return "login";
	}
}
