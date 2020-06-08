package com.woniu.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.woniu.service.UserRoleService;

@Controller
public class UserRoleController {
	@Autowired
	UserRoleService userRoleService;
}
