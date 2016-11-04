package com.jing.ebike.mapper;

import java.util.List;
import java.util.Map;

import com.jing.ebike.model.User;

public interface UserMapper {

	User userLogin(Map<String, Object> map);

	List<User> queryPageMap(Map<Object, Object> map);

	void insert(User user);

	User getById(String id);

	void update(User user);

	void deleteById(String id);

	void updatePwd(Map<String, Object> map);

	User getByUserName(String userName);

	User getByMobile(String mobile);

	String getUserIdByMobile(String mobile);

}
