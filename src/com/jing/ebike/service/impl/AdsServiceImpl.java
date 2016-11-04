package com.jing.ebike.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import com.jing.common.page.PageView;
import com.jing.ebike.mapper.AdsMapper;
import com.jing.ebike.model.Ads;
import com.jing.ebike.service.AdsService;
@Service(value="adsService")
public class AdsServiceImpl implements AdsService {
	@Resource
	private AdsMapper adsMapper;

	@Override
	public ModelMap queryAdsMap(PageView pageView, Ads ads) {
		Map<Object, Object> map = new HashMap<Object, Object>();
		map.put("paging", pageView);
		map.put("t", ads);
		List<Ads> rows = adsMapper.queryPageMap(map);
		ModelMap modelMap = new ModelMap();
		modelMap.addAttribute("records", rows);
		modelMap.addAttribute("sEcho", pageView.getsEcho());
		modelMap.addAttribute("iTotalRecords", pageView.getRowCount());
		modelMap.addAttribute("iTotalDisplayRecords", pageView.getRowCount());
		modelMap.addAttribute("sStatus", "OK");
		return modelMap;
	}

	@Override
	public void insert(Ads ads) {
		adsMapper.insert(ads);
	}

	@Override
	public Ads getById(String id) {
		return adsMapper.getById(id);
	}

	@Override
	public void update(Ads ads) {
		adsMapper.update(ads);
	}

	@Override
	public void deleteById(String id) {
		adsMapper.deleteById(id);
	}

	@Override
	public List<Ads> getAll() {
		return adsMapper.getAll();
	}
	
}
