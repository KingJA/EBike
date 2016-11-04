package com.jing.ebike.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jing.ebike.model.Ads;
import com.jing.ebike.model.Appointment;
import com.jing.ebike.model.CarNumber;
import com.jing.ebike.model.Complaint;
import com.jing.ebike.service.AdsService;
import com.jing.ebike.service.AppointmentService;
import com.jing.ebike.service.CarNumberService;
import com.jing.ebike.service.ComplaintService;

@Controller
public class MobileController {
	@Resource
	private ComplaintService complaintService;
	@Resource
	private AppointmentService appointmentService;
	@Resource
	private CarNumberService carNumberService;
	@Resource
	private AdsService adsService;
	/**
	 * 登录
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("login")
	public ModelAndView login(HttpServletRequest request,Model model) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/frontend/login");      
		return mv;
	}
	/**
	 * 注册
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("register")
	public ModelAndView register(HttpServletRequest request,Model model) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/frontend/register");      
		return mv;
	}
	/**
	 * 首页
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("index")
	public ModelAndView index(HttpServletRequest request,Model model,HttpSession session) {
		ModelAndView mv = new ModelAndView();
		List<Ads> adsList = adsService.getAll();
		mv.addObject("adsList", adsList);
		String userId = (String) session.getAttribute("userId");
		if(userId!=null && !"".equals(userId)){
			List<CarNumber> carNumbers = carNumberService.getByUserId(userId);
			if(carNumbers!=null){
				if(session.getAttribute("carNumbers")!=null) session.removeAttribute("carNumbers");
				session.setAttribute("carNumbers", carNumbers);
			}
		}
		mv.setViewName("/frontend/index");      
		return mv;
	}
	/**
	 * 个人中心
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("mycenter")
	public ModelAndView mycenter(HttpServletRequest request,Model model) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/frontend/mycenter");      
		return mv;
	}
	/**
	 * 投诉中心
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("complaint")
	public ModelAndView complaint(HttpServletRequest request,Model model) {
		ModelAndView mv = new ModelAndView();
		Integer page = 1;
		mv.addObject("page", page);
		List<Complaint> complaints = complaintService.getComplaints((page-1)*10,null);
		mv.addObject("complaints", complaints);
		mv.setViewName("/frontend/complaint");      
		return mv;
	}
	
	@RequestMapping("mycomplaint")
	public ModelAndView mycomplaint(HttpServletRequest request,Model model,HttpSession session) {
		ModelAndView mv = new ModelAndView();
		if(session.getAttribute("userId")==null){
			mv.setViewName("redirect:/login"); 
		}else{
			Integer page = 1;
			mv.addObject("page", page);
			List<Complaint> complaints = complaintService.getComplaints((page-1)*10,session.getAttribute("userId").toString());
			mv.addObject("complaints", complaints);
			mv.setViewName("/frontend/mycomplaint");    
		}
		return mv;
	}
	
	@RequestMapping("complaintDetail/{id}")
	public ModelAndView complaintDetail(@PathVariable String id, HttpServletRequest request,Model model) {
		ModelAndView mv = new ModelAndView();
		Complaint complaint = complaintService.getById(id);
		mv.addObject("complaint", complaint);
		mv.setViewName("/frontend/complaintDetail");      
		return mv;
	}
	
	@RequestMapping("newComplaint")
	public ModelAndView newComplaint(HttpServletRequest request,Model model) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/frontend/newComplaint");      
		return mv;
	}
	
	/**
	 * 选号
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("selectNumber")
	public ModelAndView selectNumber(HttpServletRequest request,Model model) {
		ModelAndView mv = new ModelAndView();
		Integer page = 1;
		mv.addObject("page", page);
		List<CarNumber> carNumbers = carNumberService.getAvailableCarNumbers((page-1)*10);
		mv.addObject("carNumbers", carNumbers);
		mv.setViewName("/frontend/selectNumber");      
		return mv;
	}
	/**
	 * 预约
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("sendAppoint")
	public ModelAndView sendAppoint(HttpServletRequest request,Model model) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/frontend/sendAppoint");      
		return mv;
	}
	/**
	 * 我的预约
	 * @param request
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping("myappoint")
	public ModelAndView myappoint(HttpServletRequest request,Model model,HttpSession session) {
		ModelAndView mv = new ModelAndView();
		if(session.getAttribute("userId")==null){
			mv.setViewName("redirect:/login"); 
		}else{
			String userId = session.getAttribute("userId").toString();
			List<Appointment> appointments = appointmentService.getAppointsByUserId(userId);
			mv.addObject("appointments", appointments);
			mv.setViewName("/frontend/myappoint");    
		}
		return mv;
	}
	
	@RequestMapping("appointDetail/{id}")
	public ModelAndView appointDetail(@PathVariable String id, HttpServletRequest request,Model model) {
		ModelAndView mv = new ModelAndView();
		Appointment appoint = appointmentService.getById(id);
		mv.addObject("appoint", appoint);
		mv.setViewName("/frontend/appointDetail");      
		return mv;
	}
	
	@RequestMapping("changePasswd")
	public ModelAndView changePasswd(HttpServletRequest request,Model model) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/frontend/changePasswd");      
		return mv;
	}

	@RequestMapping("modifyInfo")
	public ModelAndView modifyInfo(HttpServletRequest request,Model model) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/frontend/modifyInfo");      
		return mv;
	}
	
	@RequestMapping("myinfo")
	public ModelAndView myinfo(HttpServletRequest request,Model model) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/frontend/myinfo");      
		return mv;
	}
	
	private int daysBetween(Date smdate,Date bdate) 
	{    
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");  
		try {
			smdate=sdf.parse(sdf.format(smdate)); 
			bdate=sdf.parse(sdf.format(bdate));
		} catch (ParseException e) {
			e.printStackTrace();
		}  
		Calendar cal = Calendar.getInstance();    
		cal.setTime(smdate);    
		long time1 = cal.getTimeInMillis();                 
		cal.setTime(bdate);    
		long time2 = cal.getTimeInMillis();         
		long between_days=(time2-time1)/(1000*3600*24);  
		return Integer.parseInt(String.valueOf(between_days));           
	}    


}
