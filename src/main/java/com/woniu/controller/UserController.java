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
import com.woniu.entity.User;
import com.woniu.service.UserService;

@Controller
@RequestMapping("user")
public class UserController {
	@Autowired
	UserService userService;

	@RequestMapping("list")
	public String list(HttpSession session, Model model) {
		if (session.getAttribute("loginUser") != null) {
			return "WEB-INF/user/user_list";
		}
		model.addAttribute("msg", "请先登录");
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
			List<User> userList = new ArrayList<User>();
			/* userList = userService.findAll(condition); */
			userList = userService.findByOrCondition(condition);
			PageInfo<User> pageInfo = new PageInfo<>(userList);
			map.put("userList", userList);
			map.put("pageInfo", pageInfo);
			map.put("msg", "ok");
		} else {
			map.put("msg", "no");
		}
		return map;

	}

	@RequestMapping("add")
	public String add(Model model, HttpSession session) {
		if (session.getAttribute("loginUser") != null) {
			return "WEB-INF/user/user_add";
		}
		model.addAttribute("msg", "请先登录");
		return "login";
	}

	@RequestMapping("update")
	@ResponseBody
	public Map<String, Object> update(Model model, HttpSession session, User user) {
		Map<String, Object> map = new HashMap<String, Object>();
		if (session.getAttribute("loginUser") != null) {
			User user1 = userService.findOne(user.getUid());
			map.put("user", user1);
			map.put("msg", "ok");
		} else {
			map.put("msg", "no");
		}

		return map;

	}

	@RequestMapping("updateDo")
	@ResponseBody
	public Map<String, Object> updateDo(Model model, HttpSession session, User user) {
		Map<String, Object> map = new HashMap<String, Object>();
		if (session.getAttribute("loginUser") != null) {
			try {
				userService.update(user);
				map.put("msg", "ok");
			} catch (Exception e) {
				e.printStackTrace();
				map.put("msg", "no");
			}
		}
		return map;
	}

	@RequestMapping("addDo")
	public String addDo(Model model, HttpSession session, User user) {
		if (session.getAttribute("loginUser") != null) {
			try {
				userService.save(user);
				return "redirect:list";
			} catch (Exception e) {
				e.printStackTrace();
				return "redirect:add";
			}
		}
		model.addAttribute("msg", "请先登录");
		return "login";
	}

	@RequestMapping("deleteDo")
	@ResponseBody
	public Map<String, Object> deleteDo(HttpSession session, Integer[] uid) {
		Map<String, Object> map = new HashMap<>();
		if (session.getAttribute("loginUser") != null) {
			try {
				userService.delete(uid);
				map.put("msg", "ok");
			} catch (Exception e) {
				e.printStackTrace();
				map.put("msg", "删除失败");
			}
		}

		return map;
	}

}
