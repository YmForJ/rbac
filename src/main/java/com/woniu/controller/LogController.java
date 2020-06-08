package com.woniu.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.woniu.entity.User;
import com.woniu.service.UserService;

@Controller
public class LogController {
	@Autowired
	UserService userService;

	@RequestMapping("login")
	public String login(User user) {
		User result = userService.login(user);
		if (result != null) {
			return "redirect:list";
		}
		return "login";
	}
}
