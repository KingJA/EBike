package com.jing.ebike.controller.admin;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

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
import com.jing.ebike.model.User;
import com.jing.ebike.service.UserService;
import com.jing.utils.MD5Utils;
import com.jing.utils.UUIDUtils;

@Controller
@RequestMapping(value="backenduser")
public class UserAdminController {
	@Resource
	private UserService userService;
	/**
	 * 用户管理
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("userManagement")
	public ModelAndView userManagement(HttpServletRequest request,Model model) {
		ModelAndView mv = new ModelAndView();
		String activeTab = (request.getParameter("activeTab") == null ? "" : request.getParameter("activeTab"));
		if(activeTab != null && activeTab != "") {
			model.addAttribute("activeTab", activeTab);
		}else {
			model.addAttribute("activeTab", "tab_0");
		}
		mv.setViewName("/backend/user/userManagement");      
		return mv;
	}
	
	@RequestMapping("adminManagement")
	public ModelAndView adminManagement(HttpServletRequest request,Model model) {
		ModelAndView mv = new ModelAndView();
		String activeTab = (request.getParameter("activeTab") == null ? "" : request.getParameter("activeTab"));
		if(activeTab != null && activeTab != "") {
			model.addAttribute("activeTab", activeTab);
		}else {
			model.addAttribute("activeTab", "tab_0");
		}
		mv.setViewName("/backend/user/adminManagement");      
		return mv;
	}
	/**
	 * 查询用户
	 * @param pageView
	 * @param user
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "queryMap", method = RequestMethod.POST)
	public @ResponseBody
	ModelMap query( PageView pageView,User user,HttpSession session)  throws Exception {
		ModelMap resultMap = new ModelMap();
		user.setStatus(2);//车主
		resultMap = userService.queryUserMap(pageView, user);
		return resultMap;
	}
	
	@RequestMapping(value = "queryAdminMap", method = RequestMethod.POST)
	public @ResponseBody
	ModelMap queryAdmin( PageView pageView,User user,HttpSession session)  throws Exception {
		ModelMap resultMap = new ModelMap();
		user.setStatus(1);//管理员
		resultMap = userService.queryUserMap(pageView, user);
		return resultMap;
	}
	
	@RequestMapping("newAdmin")
	public ModelAndView addUser(Model model) {
		model.addAttribute("doType", "add");
		return new ModelAndView("/backend/user/adminAction");
	}
	
	@RequestMapping(value = "saveAdmin", method = RequestMethod.POST)
	public String saveAdmin(@ModelAttribute("user") User user, HttpSession session) {
		user.setId(UUIDUtils.generateUUID());
		user.setStatus(1);
		user.setPassWd(MD5Utils.getMD5Str("123456"));//初始化
		user.setCreateTime(new Date());
		userService.insert(user);
		return "redirect:/backenduser/adminManagement";
	}
	
	@RequestMapping("getAdmin")
	public ModelAndView getAdmin(String id,HttpServletRequest request){
		User user = (User) userService.getById(id);
		ModelAndView mv = new ModelAndView("/backend/user/adminAction");
		mv.addObject("doType", "edit");
		mv.addObject("user",user);
		return mv;
	}
	
	@RequestMapping(value = "updateAdmin", method = RequestMethod.POST)
	public String updateAdmin(@ModelAttribute("user") User user, HttpSession session){
		userService.update(user);
		return "redirect:/backenduser/adminManagement";
	}
	
	@RequestMapping("getUser")
	public ModelAndView getUser(String id,HttpServletRequest request){
		User user = (User) userService.getById(id);
		ModelAndView mv = new ModelAndView("/backend/user/userAction");
		mv.addObject("doType", "edit");
		mv.addObject("user",user);
		return mv;
	}
	
	@RequestMapping(value = "updateUser", method = RequestMethod.POST)
	public String updateUser(@ModelAttribute("user") User user, HttpSession session){
		userService.update(user);
		return "redirect:/backenduser/userManagement";
	}
	
	/**
	 * 通用
	 * @param id
	 * @param session
	 * @param request
	 * @return
	 */
	
	
	@RequestMapping(value = "deleteUser", method = RequestMethod.POST)
	public @ResponseBody
	Map<String, Object> delete(String id,HttpSession session,HttpServletRequest request) {
		Map<String, Object> modelMap = new HashMap<String, Object>();
		try {
			userService.deleteById(id);
			modelMap.put("success", "true");
		} catch (Exception e) {
			modelMap.put("error", "true");
			e.printStackTrace();
		}  finally {

		}
		return modelMap;
	}
}
