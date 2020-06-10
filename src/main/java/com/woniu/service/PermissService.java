package com.woniu.service;

import java.util.List;

import com.woniu.entity.Permission;

public interface PermissService {

	List<Permission> initTree();

	List<Permission> findAll();

	void save(Permission permission);

	void delete(Integer pid);

	Permission findOne(Integer pid);

	void update(Permission permission);

}
