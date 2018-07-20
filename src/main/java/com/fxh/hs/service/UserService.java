package com.fxh.hs.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fxh.hs.entity.User;
import com.fxh.hs.entity.UserExample;
import com.fxh.hs.mapper.UserMapper;

@Service
public class UserService {
	@Autowired
	private UserMapper userMapper;
	//登录检测
	public List<User> login(User user){
		UserExample example=new UserExample();
		example.createCriteria().andUsernameEqualTo(user.getUsername()).andPwdEqualTo(user.getPwd());
		return userMapper.selectByExample(example);
	}
}
