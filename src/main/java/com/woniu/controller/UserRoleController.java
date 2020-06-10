package com.woniu.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.woniu.service.UserRoleService;

@Controller
@RequestMapping("userrole")
public class UserRoleController {
	@Autowired
	UserRoleService userRoleService;

	@RequestMapping("assignRoleDo")
	@ResponseBody
	public Map<String, Object> assignRoleDo(Integer uid, Integer[] rids, HttpSession session) {
		Map<String, Object> map = new HashMap<>();
		if (session.getAttribute("loginUser") != null) {
			try {
				userRoleService.saveAll(uid, rids);
				map.put("result", "ok");

			} catch (Exception e) {
				e.printStackTrace();
				map.put("result", "no");
			}
		} else {
			map.put("result", "login");
		}

		return map;
	}

	@RequestMapping("unAssignRoleDo")
	@ResponseBody
	public Map<String, Object> unAssignRoleDo(Integer uid, Integer[] rids2, HttpSession session) {
		Map<String, Object> map = new HashMap<>();
		if (session.getAttribute("loginUser") != null) {
			try {
				userRoleService.deleteAll(uid, rids2);
				map.put("result", "ok");

			} catch (Exception e) {
				e.printStackTrace();
				map.put("result", "no");
			}
		} else {
			map.put("result", "login");
		}

		return map;
	}
}
