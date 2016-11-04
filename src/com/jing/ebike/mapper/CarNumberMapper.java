package com.jing.ebike.mapper;

import java.util.List;
import java.util.Map;

import com.jing.ebike.model.CarNumber;

public interface CarNumberMapper {

	void deleteById(String id);

	void update(CarNumber carNumber);

	CarNumber getById(String id);

	void insert(CarNumber carNumber);

	List<CarNumber> queryPageMap(Map<Object, Object> map);

	CarNumber isExistCarNum(String carNum);

	List<CarNumber> getByUserId(String userId);

	List<CarNumber> getAvailableCarNumbers(Map<String, Object> map);

	void updateByNum(CarNumber carNumber);

}
