package com.woniu.service;

import java.util.List;

import com.woniu.entity.User;

public interface UserService {

	List<User> findAll(String condition);

	User login(User user);

	void save(User user);

	void delete(Integer[] uid);

	User findOne(Integer uid);

	void update(User user);

	List<User> findByOrCondition(String condition);

}
