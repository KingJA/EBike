package com.jing.common.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jing.common.model.GeneralResponse;
import com.jing.ebike.model.User;
import com.jing.ebike.service.UserService;

@Controller
@RequestMapping("admin")
public class BackendController {
	@Resource
	private UserService userService;
	@RequestMapping("login")
	public ModelAndView login(HttpServletRequest request,Model model) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/backend/login");      
		return mv;
	}
	
	@RequestMapping("index")
	public ModelAndView index(HttpServletRequest request,Model model) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/backend/index");
		return mv;
	}
	
//	@RequestMapping("loginValidate")
//	public ModelAndView loginValidate(User user, HttpServletRequest request,Model model,HttpSession session) {
//		ModelAndView mv = new ModelAndView();
//		mv.setViewName("/backend/index");
//		User adminUser = userService.userLogin(user.getUserName(), user.getPassWd());
//		if(adminUser==null){
//			mv.addObject("msg", "用户名或者密码错误");
//			mv.setViewName("/backend/login");
//		}else if(adminUser.getStatus()!=1){
//			mv.addObject("msg", "您不是管理员不能登录管理后台");
//			mv.setViewName("/backend/login");
//		}else{
//			session.setAttribute("adminUser", adminUser);
//			mv.setViewName("/backend/index");
//		}
//		return mv;
//	}
	
	/**
	 * 用户登陆
	 * */
	@RequestMapping(value = "login.do", method = RequestMethod.POST)
	@ResponseBody
	public GeneralResponse adminLogin(String userName,String passWord,Integer login,HttpSession sess) {
		GeneralResponse message = new GeneralResponse();
		try {
			User admin = userService.userLogin(userName,passWord);
				if(admin!=null){
					if(login!=null&&login==1){
						sess.setAttribute("adminName", userName);
						sess.setAttribute("adminId", admin.getId());
						sess.setAttribute("loginAdmin", admin);
					}
					message.setCode(1);
					message.setMsg("用户登陆成功");
					message.setRes(admin);
				} else {
					message.setCode(0);
					message.setMsg("用户名密码错误");
				}
		} catch (Exception e) {
			message.setCode(0);
			message.setMsg(e.getMessage());
		}
		return message;
	}
}
