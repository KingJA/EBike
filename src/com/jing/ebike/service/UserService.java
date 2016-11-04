package com.jing.ebike.service;

import org.springframework.ui.ModelMap;

import com.jing.common.page.PageView;
import com.jing.ebike.model.User;

public interface UserService {

	User userLogin(String userName, String passWord);

	ModelMap queryUserMap(PageView pageView, User user);

	void insert(User user);

	User getById(String id);

	void update(User user);

	void deleteById(String id);

	void updatePwd(String passWd, String id);

	User getByUserName(String userName);

	User getByMobile(String mobile);
	
	String getUserIdByMobile(String mobile);

}
