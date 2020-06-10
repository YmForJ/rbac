package com.woniu.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.woniu.entity.Permission;
import com.woniu.mapper.PermissionMapper;
import com.woniu.service.PermissService;

@Service
public class PermissServiceImpl implements PermissService {
	@Autowired
	PermissionMapper permissionMapper;

	@Override
	public List<Permission> initTree() {
		List<Permission> permissionList = new ArrayList<Permission>();
		// 创建一个Map将所有的权限放入
		Map<Integer, Permission> map = new HashMap<>();
		List<Permission> nodes = permissionMapper.selectByExample(null);
		// 将所有的节点放入map中
		for (Permission permission : nodes) {
			map.put(permission.getPid(), permission);
		}
		// 遍历所有的节点,找到这个节点对应的子节点。如果不存在子节点,那么将该节点加入到要返回的List中
		// 中间没有更换对象,后续添加的父节点的子节点将会更新到结果集中;
		for (Permission node : nodes) {
			// 查找这个节点对应的父节点对象
			Permission temp = map.get(node.getParentid());
			if (temp != null) {
				temp.getChildren().add(node);
			} else {
				// 如果这个节点没有父节点，那么它是根节点,将他加入到返回的List中
				permissionList.add(node);
			}
		}

		return permissionList;
	}

	@Override
	public List<Permission> findAll() {
		return permissionMapper.selectByExample(null);
	}

	@Override
	public void save(Permission permission) {
		permissionMapper.insertSelective(permission);
	}

	@Override
	public void delete(Integer pid) {
		permissionMapper.deleteByPrimaryKey(pid);
	}

	@Override
	public Permission findOne(Integer pid) {
		return permissionMapper.selectByPrimaryKey(pid);
	}

	@Override
	public void update(Permission permission) {
		permissionMapper.updateByPrimaryKeySelective(permission);
	}

}
