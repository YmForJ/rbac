package com.woniu.service;

import java.util.List;

import com.woniu.entity.Role;
import com.woniu.entity.User;

public interface RoleService {

	List<Role> findUnAssignRoleByUid(Integer uid);

	List<Role> findAssignRoleByUid(Integer uid);

	List<User> findByOrCondition(String condition);

	void save(Role role);

	Role findOne(Integer rid);

	void update(Role role);

	void delete(Integer[] rid);


}
