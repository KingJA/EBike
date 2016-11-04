package com.jing.common.controller;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cn.jpush.api.common.resp.APIConnectionException;
import cn.jpush.api.common.resp.APIRequestException;
import cn.jpush.api.push.PushResult;
import cn.jpush.api.push.model.PushPayload;

import com.jing.common.model.GeneralResponse;
import com.jing.common.model.Point;
import com.jing.ebike.service.UserService;
import com.jing.utils.Base64Image;
import com.jing.utils.Jiguang;
import com.jing.utils.SecurityCode;
import com.jing.utils.SecurityImage;
/**
 * 配置一些通用的常用的不限制一级路径的controller
 * @author Administrator
 *
 */
@Controller(value="commonController")
public class CommonController {
	private Logger logger = Logger.getLogger(CommonController.class); 
	@Resource
	private UserService userService;
	
	@RequestMapping("pushMessage")
	public ModelAndView pushMessage(String title, String content, String mobile, HttpServletRequest request,Model model) {
		GeneralResponse message = new GeneralResponse();
		ModelAndView mv = new ModelAndView();
		if(StringUtils.isEmpty(mobile)){
			message.setCode(0);
			message.setMsg("必须传入手机号");
		}
		try {
			String userId = userService.getUserIdByMobile(mobile);
			if (userId != null) {
				message.setCode(1);
				message.setMsg("用户id获取成功");
				message.setRes(userId);
				mv.addObject("title", title);
				mv.addObject("content", content);
				mv.addObject("userId", userId);
			} else {
				message.setCode(0);
				message.setMsg("找不到用户");
			}
		} catch (Exception e) {
			message.setCode(0);
			message.setMsg(e.getMessage());
		}
		mv.addObject("message", message);
		mv.setViewName("/frontend/push");      
		return mv;
	}
	
	
	@RequestMapping("push")
	@ResponseBody
	public GeneralResponse push(String title, String content, String mobile, String alert_addr, String longitude, String latitude, String licenseNumber, HttpServletRequest request, HttpSession session, Model model) {
		GeneralResponse message = new GeneralResponse();
		ModelAndView mv = new ModelAndView();
		logger.info("push push title:"+title+",content:"+content+",mobile:"+mobile+",licenseNumber:"+licenseNumber);
		if(StringUtils.isEmpty(mobile)){
			message.setCode(0);
			message.setMsg("必须传入手机号");
		}else{
			try {
				String userId = userService.getUserIdByMobile(mobile);
				logger.info("push push userId "+userId);
				if (userId != null) {
					mv.addObject("title", title);
					mv.addObject("content", content);
					mv.addObject("userId", userId);
					PushPayload payload = Jiguang.buildPushObject_single_alert(content, title, userId);//Jiguang.buildPushObject_all_all_alert();  
			        try {
						PushResult result = Jiguang.jPushClient.sendPush(payload);
						System.out.println("push location " + result.toString());
						Point point = new Point();
						if(!StringUtils.isEmpty(longitude)&&!StringUtils.isEmpty(latitude)){
							point.setLatitude(Double.valueOf(latitude));
							point.setLongitude(Double.valueOf(longitude));
							point.setAlertAddr(alert_addr==null ? "" : alert_addr);
						}else if(!StringUtils.isEmpty(alert_addr)){
							point.setAlertAddr(alert_addr);
						}
						session.getServletContext().setAttribute("location"+licenseNumber, point);
						System.out.println("push location session set success "+licenseNumber);
						logger.info("push push location session set success "+licenseNumber);
						message.setCode(1);
						message.setMsg("用户id获取成功,推送也成功");
						message.setRes(userId);
					} catch (APIConnectionException e) {
						e.printStackTrace();
					} catch (APIRequestException e) {
						e.printStackTrace();
					}  
				} else {
					message.setCode(0);
					message.setMsg("找不到用户");
				}
			} catch (Exception e) {
				message.setCode(0);
				message.setMsg(e.getMessage());
			}
		}
		return message;
	}
	
	/**
	 * 前端用户登录超时
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("sessionTimeout")
	public ModelAndView sessionTimeout(HttpServletRequest request,Model model) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/frontend/index");      
		return mv;
	}
	/**
	 * 前端用户没有权限
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("noPriv")
	public ModelAndView noPriv(HttpServletRequest request,Model model) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/frontend/index");      
		return mv;
	}
	@RequestMapping("404")
	public ModelAndView fourofour(HttpServletRequest request,Model model) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/frontend/page404");
		return mv;
	}
	@RequestMapping("500")
	public ModelAndView fiveoo(HttpServletRequest request,Model model) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/frontend/page500");
		return mv;
	}
	
	/**
	 * 后台管理员登录超时
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("backendTimeout")
	public ModelAndView backendTimeout(HttpServletRequest request,Model model) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/admin/login");   
		return mv;
	}
	@RequestMapping("loadImageBase64Data")
	@ResponseBody
	public String loadImageBase64Data(String imageURL){
		return Base64Image.getImageStr(imageURL);
	}
	
	/**
	 * 产生并返回验证码
	 * @param session
	 * @param response
	 */
	@RequestMapping("/common/securityCodeImageAction")
	public void securityCodeImageAction(HttpSession session,
            HttpServletResponse response) {
		 String securityCode = SecurityCode.getSecurityCode();
		 ByteArrayInputStream imageStream = SecurityImage.getImageAsInputStream(securityCode);
		 //放入session中
		 session.setAttribute("SESSION_SECURITY_CODE", securityCode);
		 response.setContentType("image/jpeg");
	     OutputStream stream;
		try {
			stream = response.getOutputStream();
		     byte[] tmp = new byte[1];    
	         while(imageStream.read(tmp)!=-1){
	        	 stream.write(tmp);
	         }
		     stream.flush();
		     stream.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/common/validateCode")
	@ResponseBody
	public boolean validateCode(HttpSession session,String code){
		String sessionCode = (String) session.getAttribute("SESSION_SECURITY_CODE");
		if(code!=null && sessionCode!=null && code.equals(sessionCode)){
			return true;
		}else return false;
	}
	
	@RequestMapping("/common/validateMsgCode")
	@ResponseBody
	public boolean validateMsgCode(HttpSession session,String msgCodeVerify){
		String sessionCode = (String) session.getAttribute("FIND_PWD_MSG_CODE");
		if(msgCodeVerify!=null && sessionCode!=null && msgCodeVerify.equals(sessionCode)){
			return true;
		}else return false;
	}
	
	
	
}
