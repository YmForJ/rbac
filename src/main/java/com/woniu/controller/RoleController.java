package com.woniu.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.woniu.entity.Role;
import com.woniu.entity.User;
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

	@RequestMapping("init")
	public String init(HttpSession session) {
		if (session.getAttribute("loginUser") != null) {
			return "WEB-INF/role/index";
		}
		return "login";
	}

	@RequestMapping("listDo")
	@ResponseBody
	public Map<String, Object> listDo(@RequestParam(name = "pageNum", defaultValue = "1") Integer pageNum,
			@RequestParam(name = "pageSize", defaultValue = "5") Integer pageSize, HttpSession session,
			String condition) {
		Map<String, Object> map = new HashMap<String, Object>();
		PageHelper.startPage(pageNum, pageSize);
		if (session.getAttribute("loginUser") != null) {
			List<User> roleList = new ArrayList<User>();
			/* userList = userService.findAll(condition); */
			roleList = roleService.findByOrCondition(condition);
			PageInfo<User> pageInfo = new PageInfo<>(roleList);
			map.put("roleList", roleList);
			map.put("pageInfo", pageInfo);
			map.put("msg", "ok");
		} else {
			map.put("msg", "no");
		}
		return map;

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

	@RequestMapping("add")
	public String add(Model model, HttpSession session) {
		if (session.getAttribute("loginUser") != null) {
			return "WEB-INF/role/role_add";
		}
		model.addAttribute("msg", "请先登录");
		return "login";
	}

	@RequestMapping("addDo")
	@ResponseBody
	public Map<String, Object> addDo(HttpSession session, Role role) {
		Map<String, Object> map = new HashMap<String, Object>();
		if (session.getAttribute("loginUser") != null) {
			try {
				roleService.save(role);
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

	@RequestMapping("update")
	@ResponseBody
	public Map<String, Object> update(Model model, HttpSession session, Role role) {
		Map<String, Object> map = new HashMap<String, Object>();
		if (session.getAttribute("loginUser") != null) {
			try {
				Role role1 = roleService.findOne(role.getRid());
				map.put("role", role1);
				map.put("msg", "ok");
			} catch (Exception e) {
				e.printStackTrace();
				map.put("msg", "no");
			}
		} else {
			map.put("msg", "login");
		}

		return map;

	}

	@RequestMapping("updateDo")
	@ResponseBody
	public Map<String, Object> updateDo(Model model, HttpSession session, Role role) {
		Map<String, Object> map = new HashMap<String, Object>();
		if (session.getAttribute("loginUser") != null) {
			try {
				roleService.update(role);
				map.put("msg", "ok");
			} catch (Exception e) {
				e.printStackTrace();
				map.put("msg", "no");
			}
		} else {
			map.put("msg", "login");
		}
		return map;
	}

	@RequestMapping("deleteDo")
	@ResponseBody
	public Map<String, Object> deleteDo(HttpSession session, Integer[] rid) {
		Map<String, Object> map = new HashMap<>();
		System.out.println(rid);
		if (session.getAttribute("loginUser") != null) {
			try {
				roleService.delete(rid);
				map.put("msg", "ok");
			} catch (Exception e) {
				e.printStackTrace();
				map.put("msg", "删除失败");
			}
		}

		return map;
	}

}
