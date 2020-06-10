package com.woniu.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.woniu.entity.Role;
import com.woniu.service.RoleService;

@Controller
@RequestMapping("role")
public class RoleController {
	@Autowired
	RoleService roleService;

	@RequestMapping("assignRoleInit")
	public String assignRoleInit(Integer uid, Model model, HttpSession session) {
		if (session.getAttribute("loginUser") != null) {
			model.addAttribute("uid", uid);
			return "WEB-INF/role/assignrole";
		}
		return "login";
	}

	@RequestMapping("assignRole")
	@ResponseBody
	public Map<String, Object> assignRole(Integer uid, HttpSession session) {
		Map<String, Object> map = new HashMap<>();
		if (session.getAttribute("loginUser") != null) {
			try {
				List<Role> unAssignRoleList = roleService.findUnAssignRoleByUid(uid);
				List<Role> assignRoleList = roleService.findAssignRoleByUid(uid);
				map.put("result", true);
				map.put("unAssignRoleList", unAssignRoleList);
				map.put("assignRoleList", assignRoleList);
			} catch (Exception e) {
				e.printStackTrace();
				map.put("result", false);
			}
		}

		return map;
	}


}
