package com.woniu.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.woniu.service.RolePService;

@Controller
public class RolePController {
	@Autowired
	RolePService rolePService;
}
