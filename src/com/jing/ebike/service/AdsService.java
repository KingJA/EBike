package com.jing.ebike.service;

import java.util.List;

import org.springframework.ui.ModelMap;

import com.jing.common.page.PageView;
import com.jing.ebike.model.Ads;

public interface AdsService {

	ModelMap queryAdsMap(PageView pageView, Ads ads);

	void insert(Ads ads);

	Ads getById(String id);

	void update(Ads ads);

	void deleteById(String id);

	List<Ads> getAll();

}
