package com.jing.ebike.service;

import java.util.List;

import org.springframework.ui.ModelMap;

import com.jing.common.page.PageView;
import com.jing.ebike.model.CarNumber;

public interface CarNumberService {

	ModelMap queryCarNumMap(PageView pageView, CarNumber carNumber);

	void insert(CarNumber carNumber);

	CarNumber getById(String id);

	void update(CarNumber carNumber);

	void deleteById(String id);

	boolean isExistCarNum(String carNum);

	List<CarNumber> getByUserId(String userId);

	List<CarNumber> getAvailableCarNumbers(int page);

	void updateByNum(CarNumber carNumber);

}
