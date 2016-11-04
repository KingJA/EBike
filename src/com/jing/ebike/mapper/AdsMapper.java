package com.jing.ebike.mapper;

import java.util.List;
import java.util.Map;

import com.jing.ebike.model.Ads;

public interface AdsMapper {

	List<Ads> queryPageMap(Map<Object, Object> map);

	void insert(Ads ads);

	Ads getById(String id);

	void update(Ads ads);

	void deleteById(String id);

	List<Ads> getAll();

}
