package com.woniu.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.woniu.entity.User;
import com.woniu.entity.UserExample;
import com.woniu.entity.UserExample.Criteria;
import com.woniu.mapper.UserMapper;
import com.woniu.service.UserService;

@Service
public class UserServiceImpl implements UserService {
	@Autowired
	UserMapper userMapper;

	UserExample example = new UserExample();

	@Override
	public List<User> findAll() {
		return userMapper.selectByExample(null);
	}

	@Override
	public User login(User user) {
		example.clear();
		Criteria criteria = example.createCriteria();
		criteria.andUaccountEqualTo(user.getUaccount());
		criteria.andUpwdEqualTo(user.getUpwd());
		List<User> userList = userMapper.selectByExample(example);
		return userList.size() == 0 ? null : userList.get(0);

	}

}
