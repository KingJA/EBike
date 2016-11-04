package com.jing.ebike.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import com.jing.common.page.PageView;
import com.jing.ebike.mapper.AppointmentMapper;
import com.jing.ebike.mapper.UserMapper;
import com.jing.ebike.model.Appointment;
import com.jing.ebike.model.User;
import com.jing.ebike.service.AppointmentService;
@Service(value="appointmentService")
public class AppointmentServiceImpl implements AppointmentService {
	@Resource
	private AppointmentMapper appointmentMapper;
	@Resource
	private UserMapper userMapper;
	@Override
	public ModelMap queryAppointmentMap(PageView pageView,
			Appointment appointment) {
		Map<Object, Object> map = new HashMap<Object, Object>();
		map.put("paging", pageView);
		map.put("t", appointment);
		List<Appointment> rows = appointmentMapper.queryPageMap(map);
		for(Appointment c : rows){
			if(c.getUserId()!=null){
				User user = userMapper.getById(c.getUserId());
				if(user==null) continue;
				c.setUserName(user.getUserName()==null?"":user.getUserName());
				c.setRealName(user.getRealName()==null?"":user.getRealName());
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
	public Appointment getById(String id) {
		return appointmentMapper.getById(id);
	}

	@Override
	public void update(Appointment appointment) {
		appointmentMapper.update(appointment);
	}

	@Override
	public void insert(Appointment appointment) {
		appointmentMapper.insert(appointment);
	}

	@Override
	public List<Appointment> getAppointsByUserId(String userId) {
		List<Appointment> rows = appointmentMapper.getAppointsByUserId(userId);
		User user = null;
		for(Appointment c : rows){
			if(c.getUserId()!=null){
				if(user==null) user = userMapper.getById(c.getUserId());
				c.setUserName(user.getUserName());
				c.setRealName(user.getRealName());
			}
		}
		return rows;
	}

	@Override
	public List<Appointment> checkAppointByUser(String userId) {
		return appointmentMapper.checkAppointByUser(userId);
	}

	@Override
	public void deleteById(String id) {
		appointmentMapper.deleteById(id);
	}
	
}
