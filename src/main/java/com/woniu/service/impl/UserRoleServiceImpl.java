package com.woniu.service.impl;

import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.woniu.entity.Userrole;
import com.woniu.entity.UserroleExample;
import com.woniu.entity.UserroleExample.Criteria;
import com.woniu.mapper.UserroleMapper;
import com.woniu.service.UserRoleService;

@Service
public class UserRoleServiceImpl implements UserRoleService {
	@Autowired
	UserroleMapper userRoleMapper;
	UserroleExample example = new UserroleExample();

	@Override
	public void saveAll(Integer uid, Integer[] rids) {
		Map<String, Object> map = new HashMap<>();
		map.put("uid", uid);
		map.put("rids", rids);
		userRoleMapper.insertAll(map);

	}

	@Override
	public void deleteAll(Integer uid, Integer[] rids) {
		// TODO Auto-generated method stub
		example.clear();
		Criteria criteria = example.createCriteria();
		criteria.andUidEqualTo(uid);
		criteria.andRidIn(Arrays.asList(rids));
		userRoleMapper.deleteByExample(example);
	}

}
