package com.woniu.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.woniu.entity.Role;
import com.woniu.entity.RoleExample;
import com.woniu.entity.Userrole;
import com.woniu.entity.UserroleExample;
import com.woniu.entity.UserroleExample.Criteria;
import com.woniu.mapper.RoleMapper;
import com.woniu.mapper.UserroleMapper;
import com.woniu.service.RoleService;
import com.woniu.service.UserRoleService;

@Service
public class RoleServiceImpl implements RoleService {
	@Autowired
	RoleMapper roleMapper;
	@Autowired
	UserroleMapper userRoleMapper;

	@Override
	public List<Role> findUnAssignRoleByUid(Integer uid) {
		// 查询出用户已被赋予的角色
		UserroleExample userRoleExample = new UserroleExample();
		Criteria criteria = userRoleExample.createCriteria();
		criteria.andUidEqualTo(uid);
		System.out.println(uid);
		List<Userrole> userRoleList = userRoleMapper.selectByExample(userRoleExample);
		// 获得所有的rid存入list中
		List<Integer> rids = new ArrayList<Integer>();
		if (userRoleList != null && userRoleList.size() > 0) {
			for (Userrole userrole : userRoleList) {
				rids.add(userrole.getRid());
			}
		}
		// 查询到所有没有被赋予的角色信息
		RoleExample roleExample = new RoleExample();
		com.woniu.entity.RoleExample.Criteria criteria2 = roleExample.createCriteria();
		if (rids.size() > 0) {
			criteria2.andRidNotIn(rids);
		}
		List<Role> unAssignRoleList = roleMapper.selectByExample(roleExample);
		return unAssignRoleList;
	}

	@Override
	public List<Role> findAssignRoleByUid(Integer uid) {
		// 查询出用户已被赋予的角色
		UserroleExample userRoleExample = new UserroleExample();
		Criteria criteria = userRoleExample.createCriteria();
		criteria.andUidEqualTo(uid);
		List<Userrole> userRoleList = userRoleMapper.selectByExample(userRoleExample);
		// 获得所有的rid存入list中
		List<Integer> rids = new ArrayList<Integer>();
		if (userRoleList.size() > 0) {
			for (Userrole userrole : userRoleList) {
				rids.add(userrole.getRid());
			}
		}
		// 查询到所有没有被赋予的角色信息
		RoleExample roleExample = new RoleExample();
		com.woniu.entity.RoleExample.Criteria criteria2 = roleExample.createCriteria();
		List<Role> assignRoleList = new ArrayList<Role>();
		if (rids.size() > 0) {
			criteria2.andRidIn(rids);
			assignRoleList = roleMapper.selectByExample(roleExample);
		}
		return assignRoleList;
	}

}
