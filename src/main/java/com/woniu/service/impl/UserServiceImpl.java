package com.woniu.service.impl;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.woniu.entity.MyUserExample;
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
	public User login(User user) {
		example.clear();
		Criteria criteria = example.createCriteria();
		criteria.andUaccountEqualTo(user.getUaccount());
		criteria.andUpwdEqualTo(user.getUpwd());
		List<User> userList = userMapper.selectByExample(example);
		return userList.size() == 0 ? null : userList.get(0);

	}

	@Override
	public void save(User user) {
		userMapper.insertSelective(user);
	}

	@Override
	public void delete(Integer[] uid) {
		example.clear();
		Criteria criteria = example.createCriteria();
		criteria.andUidIn(Arrays.asList(uid));
		userMapper.deleteByExample(example);
	}

	@Override
	public User findOne(Integer uid) {
		return userMapper.selectByPrimaryKey(uid);
	}

	@Override
	public void update(User user) {
		userMapper.updateByPrimaryKeySelective(user);
	}

	@Override
	public List<User> findAll(String condition) {
		example.clear();
		Criteria criteria = example.createCriteria();
		if (condition != null && !condition.equals("")) {
			criteria.andUnameLike("%" + condition + "%");
		}
		return userMapper.selectByExample(example);

	}

	@Override
	public List<User> findByOrCondition(String condition) {
		MyUserExample myUserExample = new MyUserExample();
		if(condition!=null&& !condition.equals("")) {
			myUserExample.setCondition("%" + condition + "%");
		}
		return userMapper.selectByOrCondition(myUserExample);
	}

}
