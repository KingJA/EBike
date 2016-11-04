package com.jing.ebike.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jing.common.model.GeneralResponse;
import com.jing.ebike.model.Appointment;
import com.jing.ebike.model.User;
import com.jing.ebike.service.AppointmentService;
import com.jing.utils.DateUtil;
import com.jing.utils.UUIDUtils;

@Controller
@RequestMapping(value="appoint")
public class AppointController {
	@Resource
	private AppointmentService appointmentService;
	
	@RequestMapping("sendAppoint")
	public ModelAndView sendAppoint(Appointment appointment, HttpSession session, HttpServletRequest request,Model model) {
		ModelAndView mv = new ModelAndView();
		appointment.setAppointTime(DateUtil.getFormatDate(appointment.getAppointTimeStr()));
		appointment.setApplyTime(new java.util.Date());
		appointment.setId(UUIDUtils.generateUUID());
		appointment.setStatus(0);
		User user = (User) session.getAttribute("loginUser");
		appointment.setUserId(user.getId());
		appointmentService.insert(appointment);
		mv.setViewName("/frontend/index");      
		return mv;
	}
	
	
	@RequestMapping(value = "checkAppointByUser", method = RequestMethod.POST)
	@Transactional
	public @ResponseBody
	GeneralResponse checkAppointByUser(HttpSession session)  throws Exception {
		GeneralResponse res = new GeneralResponse();
		if(session.getAttribute("userId")==null){
			res.setCode(0);
			res.setMsg("用户未登录");
		}else{
			String userId = session.getAttribute("userId").toString();
			List<Appointment> appointments = appointmentService.checkAppointByUser(userId);
			if(appointments!=null && appointments.size()>0){
				res.setCode(2);
				res.setMsg("当前存在未审核的预约，请确认");
			}else{
				res.setCode(1);
			}
		}
		return res;
	}
	
	@RequestMapping(value = "cancelAppoint", method = RequestMethod.POST)
	@Transactional
	public @ResponseBody
	GeneralResponse cancelAppoint(HttpSession session,String id)  throws Exception {
		GeneralResponse res = new GeneralResponse();
		if(session.getAttribute("userId")==null){
			res.setCode(0);
			res.setMsg("用户未登录");
		}else{
			String userId = session.getAttribute("userId").toString();
			Appointment appointment = appointmentService.getById(id);
			if(appointment==null){
				res.setCode(0);
				res.setMsg("无效的预约");
			}else if(!appointment.getUserId().equals(userId)){
				res.setCode(0);
				res.setMsg("该预约不属于您");
			}else{
				appointmentService.deleteById(id);
				res.setCode(1);
			}
		}
		return res;
	}
	
}
