package com.woniu.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.woniu.entity.User;
import com.woniu.service.UserService;

@Controller
@RequestMapping("user")
public class UserController {
	@Autowired
	UserService userService;

	@RequestMapping("list")
	public String list(Model model) {
		List<User> userList = userService.findAll();
		model.addAttribute(userList);
		return "user/user_list";
	}

}
