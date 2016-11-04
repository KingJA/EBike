package com.jing.ebike.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import com.jing.common.page.PageView;
import com.jing.ebike.mapper.ComplaintMapper;
import com.jing.ebike.mapper.UserMapper;
import com.jing.ebike.model.Complaint;
import com.jing.ebike.model.User;
import com.jing.ebike.service.ComplaintService;
@Service(value="complaintService")
public class ComplaintServiceImpl implements ComplaintService {

	@Resource
	private ComplaintMapper complaintMapper;
	@Resource
	private UserMapper userMapper;
	@Override
	public ModelMap queryComplaintMap(PageView pageView, Complaint complaint) {
		Map<Object, Object> map = new HashMap<Object, Object>();
		map.put("paging", pageView);
		map.put("t", complaint);
		List<Complaint> rows = complaintMapper.queryPageMap(map);
		for(Complaint c : rows){
			if(c.getUserId()!=null){
				User user = userMapper.getById(c.getUserId());
				c.setUserName(user.getUserName());
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
	public Complaint getById(String id) {
		Complaint c = complaintMapper.getById(id);
		if(c.getUserId()!=null){
			User user = userMapper.getById(c.getUserId());
			c.setUserName(user.getUserName());
		}
		return c;
	}

	@Override
	public void update(Complaint complaint) {
		complaintMapper.update(complaint);
	}

	@Override
	public void insert(Complaint complaint) {
		complaintMapper.insert(complaint);
	}

	@Override
	public List<Complaint> getComplaints(int page,String userId) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("page", page);
		map.put("pageSize", 10);
		if(userId!=null && !"".equals(userId)) map.put("userId", userId);
		return complaintMapper.getComplaints(map);
	}
	
}
