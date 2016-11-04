package com.jing.ebike.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import com.jing.common.page.PageView;
import com.jing.ebike.mapper.CarNumberMapper;
import com.jing.ebike.mapper.UserMapper;
import com.jing.ebike.model.CarNumber;
import com.jing.ebike.model.User;
import com.jing.ebike.service.CarNumberService;
@Service(value="carNumberService")
public class CarNumberServiceImpl implements CarNumberService {
	@Resource
	private CarNumberMapper carNumberMapper;
	@Resource
	private UserMapper userMapper;
	@Override
	public ModelMap queryCarNumMap(PageView pageView, CarNumber carNumber) {
		Map<Object, Object> map = new HashMap<Object, Object>();
		map.put("paging", pageView);
		map.put("t", carNumber);
		List<CarNumber> rows = carNumberMapper.queryPageMap(map);
		for(CarNumber c : rows){
			if(c.getUserId()!=null){
				User user = userMapper.getById(c.getUserId());
				c.setUserName(user.getUserName());
				c.setRealName(user.getRealName());
			}
		}
		ModelMap modelMap = new ModelMap();
		modelMap.addAttribute("records", rows);
		modelMap.addAttribute("sEcho", pageView.getsEcho());
		modelMap.addAttribute("iTotalRecords", pageView.getRowCount());
		modelMap.addAttribute("iTotalDisplayRecords", pageView.getRowCount());
		modelMap.addAttribute("sStatus", "OK");
		return modelMap;
	}

	@Override
	public void insert(CarNumber carNumber) {
		carNumberMapper.insert(carNumber);
	}

	@Override
	public CarNumber getById(String id) {
		return carNumberMapper.getById(id);
	}

	@Override
	public void update(CarNumber carNumber) {
		carNumberMapper.update(carNumber);
	}

	@Override
	public void deleteById(String id) {
		carNumberMapper.deleteById(id);
	}

	@Override
	public boolean isExistCarNum(String carNum) {
		return carNumberMapper.isExistCarNum(carNum)==null?true:false;
	}

	@Override
	public List<CarNumber> getByUserId(String userId) {
		return carNumberMapper.getByUserId(userId);
	}

	@Override
	public List<CarNumber> getAvailableCarNumbers(int page) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("page", page);
		map.put("pageSize", 10);
		return carNumberMapper.getAvailableCarNumbers(map);
	}

	@Override
	public void updateByNum(CarNumber carNumber) {
		carNumberMapper.updateByNum(carNumber);
	}
	
	
}
