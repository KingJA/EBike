package com.jing.ebike.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import com.jing.common.page.PageView;
import com.jing.ebike.mapper.UserMapper;
import com.jing.ebike.model.User;
import com.jing.ebike.service.UserService;
import com.jing.utils.MD5Utils;
@Service(value="userService")
public class UserServiceImpl implements UserService{
	@Resource
	private UserMapper userMapper;

	@Override
	public User userLogin(String userName, String passWord) {
		passWord = MD5Utils.getMD5Str(passWord);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("userName", userName);
		map.put("passWord", passWord);
		return userMapper.userLogin(map);
	}

	@Override
	public ModelMap queryUserMap(PageView pageView, User user) {
		Map<Object, Object> map = new HashMap<Object, Object>();
		map.put("paging", pageView);
		map.put("t", user);
		List<User> rows = userMapper.queryPageMap(map);
		ModelMap modelMap = new ModelMap();
		modelMap.addAttribute("records", rows);
		modelMap.addAttribute("sEcho", pageView.getsEcho());
		modelMap.addAttribute("iTotalRecords", pageView.getRowCount());
		modelMap.addAttribute("iTotalDisplayRecords", pageView.getRowCount());
		modelMap.addAttribute("sStatus", "OK");
		return modelMap;
	}

	@Override
	public void insert(User user) {
		userMapper.insert(user);
	}

	@Override
	public User getById(String id) {
		return userMapper.getById(id);
	}

	@Override
	public void update(User user) {
		userMapper.update(user);
	}

	@Override
	public void deleteById(String id) {
		userMapper.deleteById(id);
	}

	@Override
	public void updatePwd(String passWd, String id) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("passWd", passWd);
		map.put("id", id);
		userMapper.updatePwd(map);
	}

	@Override
	public User getByUserName(String userName) {
		return userMapper.getByUserName(userName);
	}

	@Override
	public User getByMobile(String mobile) {
		return userMapper.getByMobile(mobile);
	}

	@Override
	public String getUserIdByMobile(String mobile) {
		return userMapper.getUserIdByMobile(mobile);
	}
	
	
}
