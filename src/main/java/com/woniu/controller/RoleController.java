package com.woniu.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.woniu.service.RoleService;

@Controller
public class RoleController {
	@Autowired
	RoleService roleService;
}
