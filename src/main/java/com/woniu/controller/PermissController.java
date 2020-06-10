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

import com.woniu.entity.Permission;
import com.woniu.entity.User;
import com.woniu.service.PermissService;

@Controller
@RequestMapping("permission")
public class PermissController {
	@Autowired
	PermissService permissService;

	@RequestMapping("init")
	public String init() {
		return "WEB-INF/permission/tree";
	}

	@RequestMapping("initAdd")
	public String initAdd(Model model, Integer pid) {
		model.addAttribute("pid", pid);
		return "WEB-INF/permission/permissionAdd";
	}

	@RequestMapping("initUpdate")
	public String initUpdate(Model model, Integer pid) {
		model.addAttribute("pid", pid);
		return "WEB-INF/permission/permissionUpdate";
	}

	@RequestMapping("addDo")
	@ResponseBody
	public Map<String, Object> addDo(HttpSession session, Permission permission) {
		Map<String, Object> map = new HashMap<>();
		User loginUser = (User) session.getAttribute("loginUser");
		if (loginUser != null) {
			try {
				permissService.save(permission);
				map.put("result", true);
			} catch (Exception e) {
				e.printStackTrace();
				map.put("result", false);
			}
		} else {
			map.put("result", false);
		}
		return map;
	}

	@RequestMapping("showUpdate")
	@ResponseBody
	public Map<String, Object> showUpdate(HttpSession session, Integer pid) {
		Map<String, Object> map = new HashMap<>();
		User loginUser = (User) session.getAttribute("loginUser");
		if (loginUser != null) {
			try {
				List<Permission> permissionList = permissService.findAll();
				Permission permission = permissService.findOne(pid);
				System.out.println(permission);
				System.out.println(permissionList);
				map.put("permissionList", permissionList);
				map.put("permission", permission);
				map.put("result", true);
			} catch (Exception e) {
				e.printStackTrace();
				map.put("result", false);
			}
		} else {
			map.put("result", false);
		}
		return map;
	}

	@RequestMapping("deleteDo")
	@ResponseBody
	public Map<String, Object> deleteDo(HttpSession session, Integer pid) {
		Map<String, Object> map = new HashMap<>();
		User loginUser = (User) session.getAttribute("loginUser");
		if (loginUser != null) {
			try {
				permissService.delete(pid);
				map.put("result", true);
			} catch (Exception e) {
				e.printStackTrace();
				map.put("result", false);
			}
		} else {
			map.put("result", false);
		}
		return map;
	}

	@RequestMapping("updateDo")
	@ResponseBody
	public Map<String, Object> updateDo(HttpSession session, Permission permission) {
		Map<String, Object> map = new HashMap<>();
		User loginUser = (User) session.getAttribute("loginUser");
		if (loginUser != null) {
			try {
				permissService.update(permission);
				map.put("result", true);
			} catch (Exception e) {
				e.printStackTrace();
				map.put("result", false);
			}
		} else {
			map.put("result", false);
		}
		return map;
	}

	@RequestMapping("initTree")
	@ResponseBody
	public List<Permission> initTree() {
		List<Permission> permissionList = permissService.initTree();

		return permissionList;
	}
}
