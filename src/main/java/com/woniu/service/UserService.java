package com.woniu.service;

import java.util.List;

import com.woniu.entity.User;

public interface UserService {

	List<User> findAll();

	User login(User user);

	void save(User user);

	void delete(Integer[] uid);

}
