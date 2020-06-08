package com.woniu.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.woniu.service.PermissService;

@Controller
public class PermissController {
	@Autowired
	PermissService permissService;
}
