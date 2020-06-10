package com.woniu.service;

import java.util.List;

import com.woniu.entity.Role;

public interface RoleService {

	List<Role> findUnAssignRoleByUid(Integer uid);

	List<Role> findAssignRoleByUid(Integer uid);

}
