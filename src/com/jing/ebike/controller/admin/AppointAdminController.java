package com.jing.ebike.controller.admin;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jing.common.page.PageView;
import com.jing.ebike.model.Appointment;
import com.jing.ebike.model.User;
import com.jing.ebike.service.AppointmentService;
import com.jing.ebike.service.UserService;

@Controller
@RequestMapping(value="backendappoint")
public class AppointAdminController {
	@Resource
	private AppointmentService appointmentService;
	@Resource
	private UserService userService;
	@RequestMapping("appointManagement")
	public ModelAndView appointmentManagement(HttpServletRequest request,Model model) {
		ModelAndView mv = new ModelAndView();
		String activeTab = (request.getParameter("activeTab") == null ? "" : request.getParameter("activeTab"));
		if(activeTab != null && activeTab != "") {
			model.addAttribute("activeTab", activeTab);
		}else {
			model.addAttribute("activeTab", "tab_0");
		}
		mv.setViewName("/backend/appoint/appointManagement");      
		return mv;
	}
	
	@RequestMapping(value = "queryAppointMap", method = RequestMethod.POST)
	public @ResponseBody
	ModelMap queryAppointmentMap( PageView pageView,Appointment appointment,HttpSession session)  throws Exception {
		ModelMap resultMap = new ModelMap();
		resultMap = appointmentService.queryAppointmentMap(pageView, appointment);
		return resultMap;
	}
	
	@RequestMapping("getAppoint")
	public ModelAndView getAppointment(String id,HttpServletRequest request){
		Appointment appointment = (Appointment) appointmentService.getById(id);
		ModelAndView mv = new ModelAndView("/backend/appoint/appointAction");
		User user = userService.getById(appointment.getUserId());
		appointment.setUserName(user.getUserName());
		appointment.setRealName(user.getRealName());
		mv.addObject("appointment",appointment);
		return mv;
	}
	
	@RequestMapping(value = "updateAppoint", method = RequestMethod.POST)
	public String updateAppointment(@ModelAttribute("appointment") Appointment appointment, HttpSession session){
		appointmentService.update(appointment);
		return "redirect:/backendappoint/appointManagement";
	}
}
