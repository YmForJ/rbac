package com.woniu.service;

public interface UserRoleService {
	void saveAll(Integer uid, Integer[] rids);

	void deleteAll(Integer uid, Integer[] rids);
}
