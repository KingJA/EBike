package com.jing.ebike.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jing.common.model.GeneralResponse;
import com.jing.common.model.Point;
import com.jing.ebike.model.CarNumber;
import com.jing.ebike.model.User;
import com.jing.ebike.service.CarNumberService;
import com.jing.ebike.service.UserService;
import com.jing.utils.ChineseTransferUtil;
import com.jing.utils.DESUtils;
import com.jing.utils.HttpRequestUtils;
import com.jing.utils.MD5Utils;
import com.jing.utils.UUIDUtils;

@Controller
@RequestMapping(value="user")
public class UserController {
	@Resource
	private UserService userService;
	@Resource
	private CarNumberService carNumberService;
	private Logger logger = Logger.getLogger(UserController.class); 
	
	@RequestMapping(value = "login.do", method = RequestMethod.POST)
	@ResponseBody
	public GeneralResponse userLogin(String userName, String passWord,
			Integer login, HttpSession sess,HttpServletRequest request,HttpServletResponse response) {
		GeneralResponse message = new GeneralResponse();
		try {
			User user = userService.userLogin(userName, passWord);
			if (user != null) {
				if (login != null && login == 1) {
					sess.setAttribute("userName", userName);
					sess.setAttribute("userId", user.getId());
					sess.setAttribute("loginUser", user);
				}
				message.setCode(1);
				message.setMsg("用户登陆成功");
				message.setRes(user);
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
	
	@RequestMapping(value = "getUserIdByMobile.do"/*, method = RequestMethod.POST*/)
	@ResponseBody
	public GeneralResponse getUserIdByMobile(String mobile) {
		GeneralResponse message = new GeneralResponse();
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
			} else {
				message.setCode(0);
				message.setMsg("找不到用户");
			}
		} catch (Exception e) {
			message.setCode(0);
			message.setMsg(e.getMessage());
		}
		return message;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "register.do", method = RequestMethod.POST)
	@ResponseBody
	@Transactional
	public GeneralResponse register(String mobileNum, String password, String repassword, String mobile, String certNo, HttpSession sess,HttpServletRequest request,HttpServletResponse response) {
		GeneralResponse message = new GeneralResponse();
		try {
			if(!password.equals(repassword)){
				message.setCode(0);
				message.setMsg("两次输入的密码不一致");
				return message;
			}
			User user = userService.getByUserName(mobileNum);
			if (user != null) {
				message.setCode(0);
				message.setMsg("用户名已存在");
				return message;
			}
			User user2 = userService.getByMobile(mobile);
			if(user2 != null){
				message.setCode(0);
				message.setMsg("该手机号已注册");
				return message;
			}
			if(certNo!=null&&!"".equals(certNo)){
				String mobi_num = mobile;
				String certNoLastSix = certNo.substring(certNo.length()-6,certNo.length());
                String path = "http://122.226.49.30:60001/wy/wy/wx/pandect-getdata.action";//"http://122.226.49.30:60001/wy/wx/getdata";
                Map<String, String> map = new HashMap<String, String>();
                map.put("rtype", "0");
                
                Map<String, Object> mapData = new HashMap<String, Object>();
        		mapData = new HashMap<String, Object>();
        		mapData.put("\"mobi_num\"", "\""+mobi_num+"\"");//手机号
        		mapData.put("\"id_six\"", "\""+certNoLastSix+"\"");//身份证后六位
        		mapData.put("\"md_five\"", "\"itylhogiwuEDjfMK\"");//MD5的加密key=================注意的点
        		System.out.println("用户查询数据=生产sign的数据是："+mapData.toString());
        		String md5Str = MD5Utils.getMD5Str(mapData.toString());//MD5加密
        		mapData.put("\"sign\"", "\""+md5Str+"\"");//用于DES加密的sign
        		mapData.remove("\"md_five\"");
        		//加密
        		String encrypt_Str = DESUtils.encrypt(mapData.toString());
        		logger.info("---------------encrypt_Str----------"+encrypt_Str);
                map.put("data", encrypt_Str);
                String encode = "UTF-8";
                HttpRequestUtils instance = new HttpRequestUtils();
                String result = instance.sendHttpClientPost(path, map, encode);
                logger.info("---------------result----------"+result);
                String resultAfterDecrypt = DESUtils.decrypt(result);
                logger.info("---------------resultAfterDecrypt----------"+resultAfterDecrypt);
//				String resultAfterDecrypt = "{\"userinfo\"=[{\"fortify\"=\"0\", \"idcard\"=\"123456789123456789\", \"mobile\"=\"12345678901\", \"licenseNumber\"=\"YK444146\", \"address\"=\"\", \"username\"=\"娴嬭瘯\", \"createtime\"=\"2016-05-29 00:00:00.0\"}, {\"fortify\"=0, \"idcard\"=\"123456789123456789\", \"mobile\"=\"12345678901\", \"licenseNumber\"=\"YK444165\", \"address\"=\"\", \"username\"=\"app娴嬭瘯\", \"createtime\"=\"2016-08-10 00:00:00.0\"}], \"result\"=true}";
                if(resultAfterDecrypt.indexOf("true")>0){
            		JSONObject strjsonObject = JSONObject.fromObject(resultAfterDecrypt);
            		Map<String, Object> map1Json = new HashMap<String, Object>();
            		map1Json = JSONObject.fromObject(strjsonObject);
            		String userInfo = map1Json.get("userinfo").toString();
            		logger.info("---------------userinfo----------"+userInfo);
            		JSONArray arrayObject = JSONArray.fromObject(userInfo);
            		User registerUser = new User();
            		String userId = UUIDUtils.generateUUID();
            		for(int i=0;i<arrayObject.size();i++){
            			JSONObject object = arrayObject.getJSONObject(i);
                		map1Json = JSONObject.fromObject(object);
                		if(map1Json.get("idcard")!=null){
                			registerUser.setCertNo(map1Json.get("idcard").toString());
                		}else{
                			registerUser.setCertNo(certNo==null?"":certNo);
                		}
                		if(map1Json.get("licenseNumber")!=null){
                			Date date = new Date();
                			CarNumber carNumber = new CarNumber();
                			carNumber.setCarNum(map1Json.get("licenseNumber").toString());
                			carNumber.setId(UUIDUtils.generateUUID());
                			carNumber.setUserId(userId);
                			carNumber.setCreateTime(date);
                			carNumber.setUseTime(date);
                			carNumberService.insert(carNumber);
                		}
            		}
            		registerUser.setId(userId);
					registerUser.setUserName(mobileNum);
					registerUser.setStatus(3);//用户
					registerUser.setCreateTime(new java.util.Date());
					registerUser.setPassWd(MD5Utils.getMD5Str(password));
					registerUser.setMobile(mobile==null?"":mobile);
					userService.insert(registerUser);
//            		strjsonObject = JSONObject.fromObject(userInfo.substring(1, userInfo.length()-1));

					message.setCode(1);
					message.setMsg("用户注册成功");
                }else{
                	message.setCode(0);
    				message.setMsg("车主信息合法性验证不通过");
    				return message;
                }
			}else{
//				message.setCode(0);
//				message.setMsg("请输入17位正确身份证号码");
//				return message;
				User registerUser = new User();
				registerUser.setId(UUIDUtils.generateUUID());
				registerUser.setUserName(mobileNum);
				registerUser.setStatus(3);//用户
				registerUser.setCreateTime(new java.util.Date());
				registerUser.setPassWd(MD5Utils.getMD5Str(password));
				registerUser.setMobile(mobile==null?"":mobile);
				registerUser.setCertNo(certNo==null?"":certNo);
				userService.insert(registerUser);
				message.setCode(1);
				message.setMsg("用户注册成功");
			}
		} catch (Exception e) {
			message.setCode(0);
			message.setMsg(e.getMessage());
		}
		return message;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "updateLicense.do", method = RequestMethod.POST)
	@ResponseBody
	@Transactional
	public GeneralResponse updateLicense(HttpSession sess,HttpServletRequest request,HttpServletResponse response) {
		GeneralResponse message = new GeneralResponse();
		User user = (User) sess.getAttribute("loginUser");
		if(user==null){
        	message.setCode(0);
			message.setMsg("请先登录后同步信息");
			return message;
		}
		String certNo = user.getCertNo();
		String mobi_num = user.getMobile();
		if(certNo==null || mobi_num==null){
			message.setCode(0);
			message.setMsg("请完善身份信息后同步");
			return message;
		}
		try {
				String certNoLastSix = certNo.substring(certNo.length()-6,certNo.length());
                String path = "http://122.226.49.30:60001/wy/wy/wx/pandect-getdata.action";//"http://122.226.49.30:60001/wy/wx/getdata";
                Map<String, String> map = new HashMap<String, String>();
                map.put("rtype", "0");
                Map<String, Object> mapData = new HashMap<String, Object>();
        		mapData = new HashMap<String, Object>();
        		mapData.put("\"mobi_num\"", "\""+mobi_num+"\"");//手机号
        		mapData.put("\"id_six\"", "\""+certNoLastSix+"\"");//身份证后六位
        		mapData.put("\"md_five\"", "\"itylhogiwuEDjfMK\"");//MD5的加密key=================注意的点
        		System.out.println("用户查询数据=生产sign的数据是："+mapData.toString());
        		String md5Str = MD5Utils.getMD5Str(mapData.toString());//MD5加密
        		mapData.put("\"sign\"", "\""+md5Str+"\"");//用于DES加密的sign
        		mapData.remove("\"md_five\"");
        		//加密
        		String encrypt_Str = DESUtils.encrypt(mapData.toString());
        		logger.info("---------------encrypt_Str----------"+encrypt_Str);
                map.put("data", encrypt_Str);
                String encode = "UTF-8";
                HttpRequestUtils instance = new HttpRequestUtils();
                String result = instance.sendHttpClientPost(path, map, encode);
                logger.info("---------------result----------"+result);
                String resultAfterDecrypt = DESUtils.decrypt(result);
                logger.info("---------------resultAfterDecrypt----------"+resultAfterDecrypt);
//				String resultAfterDecrypt = "{\"userinfo\"=[{\"fortify\"=\"0\", \"idcard\"=\"123456789123456789\", \"mobile\"=\"12345678901\", \"licenseNumber\"=\"YK444148\", \"address\"=\"\", \"username\"=\"娴嬭瘯\", \"createtime\"=\"2016-05-29 00:00:00.0\"}, {\"fortify\"=0, \"idcard\"=\"123456789123456789\", \"mobile\"=\"12345678901\", \"licenseNumber\"=\"YK444165\", \"address\"=\"\", \"username\"=\"app娴嬭瘯\", \"createtime\"=\"2016-08-10 00:00:00.0\"}], \"result\"=true}";
                if(resultAfterDecrypt.indexOf("true")>0){
            		JSONObject strjsonObject = JSONObject.fromObject(resultAfterDecrypt);
            		Map<String, Object> map1Json = new HashMap<String, Object>();
            		map1Json = JSONObject.fromObject(strjsonObject);
            		String userInfo = map1Json.get("userinfo").toString();
            		logger.info("---------------userinfo----------"+userInfo);
            		JSONArray arrayObject = JSONArray.fromObject(userInfo);
            		List<CarNumber> carNumbers = new ArrayList<CarNumber>();
            		for(int i=0;i<arrayObject.size();i++){
            			JSONObject object = arrayObject.getJSONObject(i);
                		map1Json = JSONObject.fromObject(object);
                		if(map1Json.get("licenseNumber")!=null){
                			Date date = new Date();
                			CarNumber carNumber = new CarNumber();
                			carNumber.setCarNum(map1Json.get("licenseNumber").toString());
                			carNumber.setId(UUIDUtils.generateUUID());
                			carNumber.setUserId(user.getId());
                			carNumber.setCreateTime(date);
                			carNumber.setUseTime(date);
                			carNumbers.add(carNumber);
                		}
            		}
            		List<CarNumber> userCarNumbers = carNumberService.getByUserId(user.getId());
            		Map<String, CarNumber> userCarMap = new HashMap<String, CarNumber>();
            		for(CarNumber carNumber:userCarNumbers){
            			userCarMap.put(carNumber.getCarNum(), carNumber);
            		}
            		Map<String, CarNumber> copyMap = userCarMap;
            		for(CarNumber carNumber:carNumbers){
            			if(userCarMap.get(carNumber.getCarNum())!=null){
            				copyMap.remove(carNumber.getCarNum());
            			}else{
            				logger.info("carNumberService insert value= " + carNumber);
            				carNumberService.insert(carNumber);
            			}
            		}
            		for (String key : copyMap.keySet()) {
            			CarNumber carNumber = copyMap.get(key);
            			logger.info("carNumberService deleteById key= "+ key + " and value= " + carNumber);
            			carNumberService.deleteById(carNumber.getId());
            		}
					message.setCode(1);
					message.setMsg("车牌信息同步成功");
                }else{
                	message.setCode(0);
    				message.setMsg("车主信息合法性验证不通过");
    				return message;
                }
		} catch (Exception e) {
			message.setCode(0);
			message.setMsg(e.getMessage());
		}
		return message;
	}
	
	@RequestMapping(value = "changePwd", method = RequestMethod.POST)
	@ResponseBody
	@Transactional
	public GeneralResponse changePwd(String oldPwd, String newPwd,HttpSession sess,HttpServletRequest request,HttpServletResponse response) {
		GeneralResponse res = new GeneralResponse();
		User loginUser=(User) sess.getAttribute("loginUser");
		if(loginUser.getPassWd().equals(MD5Utils.getMD5Str(oldPwd))){
			String md5Pwd = MD5Utils.getMD5Str(newPwd);
			userService.updatePwd(md5Pwd,loginUser.getId());
			res.setCode(1);
			loginUser.setPassWd(md5Pwd);
			sess.setAttribute("loginUser", loginUser);
		}else{
			res.setCode(0);
			res.setMsg("原密码输入不正确");
		}
		return res;
	}
	
	@RequestMapping(value = "updateUser", method = RequestMethod.POST)
	@ResponseBody
	@Transactional
	public GeneralResponse updateUser(String id, String realName, String mobile, String certNo, HttpSession sess) {
		GeneralResponse message = new GeneralResponse();
		try {
			User user = userService.getById(id);
			if (user == null) {
				message.setCode(0);
				message.setMsg("用户无效");
				return message;
			} else {
				User loginUser = (User) sess.getAttribute("loginUser");
				if (!user.getId().equals(loginUser.getId())) {
					message.setCode(0);
					message.setMsg("非当前登录用户无法更改");
					return message;
				}else{
					User updateUser = new User();
					updateUser.setId(id);
					updateUser.setRealName(realName==null?"":ChineseTransferUtil.transformKindEditor(realName));
					updateUser.setMobile(mobile==null?"":mobile);
					updateUser.setCertNo(certNo==null?"":certNo);
					userService.update(updateUser);
					message.setCode(1);
					updateUser.setUserName(loginUser.getUserName());
					sess.setAttribute("loginUser", updateUser);
					message.setMsg("用户信息更新成功");
				}
			}
		} catch (Exception e) {
			message.setCode(0);
			message.setMsg(e.getMessage());
		}
		return message;
	}
	
	@RequestMapping("logout")
	public ModelAndView logout(HttpSession sess,Model model) {
		sess.removeAttribute("userName");
		sess.removeAttribute("userId");
		sess.removeAttribute("loginUser");
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/index");      
		return mv;
	}
	@RequestMapping(value = "getLocation.do", method = RequestMethod.POST)
	@ResponseBody
	@Transactional
	public GeneralResponse getLocation(String carNum, HttpSession sess,HttpServletRequest request,HttpServletResponse response) {
		GeneralResponse message = new GeneralResponse();
		User loginUser = (User) sess.getAttribute("loginUser");
		if(loginUser==null){
			message.setCode(0);
			return message;
		}
        boolean test=false;
        if(test||"test".equals(loginUser.getUserName())){
        	message.setCode(1);
        	Point point = new Point();
        	point.setLongitude(120.187766);
        	point.setLatitude(30.286877);
        	message.setRes(point);
			return message;
        }
		try {
			if(sess.getServletContext().getAttribute("location"+carNum)!=null){
				message.setCode(1);
				Point point = (Point)sess.getServletContext().getAttribute("location"+carNum);
				message.setRes(point);
			}else{
				message.setCode(0);
			}
		} catch (Exception e) {
			message.setCode(0);
			message.setMsg(e.getMessage());
		}
		return message;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "setDefence", method = RequestMethod.POST)
	@ResponseBody
	@Transactional
	public GeneralResponse setDefence(String set_status, String carNum, HttpSession sess,HttpServletRequest request,HttpServletResponse response) {
		GeneralResponse message = new GeneralResponse();
		User loginUser = (User) sess.getAttribute("loginUser");
		String defenceOperation = "设防"; 
        if("0".equals(set_status)) defenceOperation = "撤防";
        boolean test=false;
        if(test||"test".equals(loginUser.getUserName())){
        	message.setCode(1);
			message.setMsg("车辆"+carNum+defenceOperation+"成功");
			return message;
        }
		try {
//				String jsonStr = "\"mobi_num\":\""+loginUser.getMobile()+"\",\"car_num\":\""+carNum+"\"";
//				logger.info("jsonStr:"+jsonStr);
//				String sign = MD5Utils.getMD5Str(jsonStr);
//				logger.info("sign:"+sign);
//				jsonStr = "{" + jsonStr + ",\"sign\":\"" + sign + "\"}";
                String path = "http://122.226.49.30:60001/wy/wy/wx/pandect-getdata.action";
                Map<String, String> map = new HashMap<String, String>();
                map.put("rtype", "1");
                
                Map<String, Object> mapData = new HashMap<String, Object>();
        		mapData = new HashMap<String, Object>();
        		mapData.put("\"mobi_num\"", "\""+loginUser.getMobile()+"\"");//用户电话号码
        		mapData.put("\"set_status\"", "\""+set_status+"\"");//
        		mapData.put("\"licenseNumber\"", "\""+carNum+"\"");//车牌号
        		mapData.put("\"md_five\"", "\"itylhogiwuEDjfMK\"");//MD5的加密key=================注意的点
        		System.out.println("用户查询数据=生产sign的数据是："+mapData.toString());
        		String md5Str = MD5Utils.getMD5Str(mapData.toString());//MD5加密
        		mapData.put("\"sign\"", "\""+md5Str+"\"");//用于DES加密的sign
        		
        		mapData.remove("\"md_five\"");
        		
        		//加密
        		String sf_encrypt_Str = DESUtils.encrypt(mapData.toString());
        		
        		
                map.put("data", sf_encrypt_Str);
                String encode = "utf8";
                HttpRequestUtils instance = new HttpRequestUtils();
                String result = instance.sendHttpClientPost(path, map, encode);
                logger.info("---------------result----------"+result);
                String resultAfterDecrypt = DESUtils.decrypt(result);//"Qia0wVT6+gGqDvNHi6qVoHljL16CORbw4afSJ+h2Mv+jwjammp0T2GgCyeZIuEQe"
                logger.info("---------------resultAfterDecrypt----------"+resultAfterDecrypt);
                if(resultAfterDecrypt.indexOf("true")>0){
            		JSONObject strjsonObject = JSONObject.fromObject(resultAfterDecrypt);
            		Map<String, Object> map1Json = new HashMap<String, Object>();
            		map1Json = JSONObject.fromObject(strjsonObject);
            		String lastaddr = map1Json.get("lastaddr").toString();
            		logger.info("---------------lastaddr1----------"+map1Json.get("lastaddr").toString());
            		message.setRes(lastaddr==null?"":lastaddr);
                	CarNumber carNumber = new CarNumber();
                	carNumber.setCarNum(carNum);
                	carNumber.setDefenceStatus(Integer.valueOf(set_status));
                	carNumberService.updateByNum(carNumber);
                	message.setCode(1);
                	if("0".equals(set_status)) sess.getServletContext().removeAttribute("location"+carNum);
					message.setMsg("车辆"+carNum+defenceOperation+"成功");
                }else{
                	message.setCode(0);
					message.setMsg("车辆"+carNum+defenceOperation+"失败");
                }
		} catch (Exception e) {
			message.setCode(0);
			message.setMsg(e.getMessage());
		}
		return message;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "setDefenceTest")
	@ResponseBody
	@Transactional
	public GeneralResponse setDefenceTest(String mobile, String set_status, String carNum, HttpServletRequest request,HttpServletResponse response) {
		GeneralResponse message = new GeneralResponse();
		String defenceOperation = "设防"; 
        if("0".equals(set_status)) defenceOperation = "撤防";
		try {
                String path = "http://122.226.49.30:60001/wy/wy/wx/pandect-getdata.action";
                Map<String, String> map = new HashMap<String, String>();
                map.put("rtype", "1");
                Map<String, Object> mapData = new HashMap<String, Object>();
        		mapData = new HashMap<String, Object>();
        		logger.info("---------------setDefenceTest----------mobile:"+mobile+",set_status:"+set_status+",carNum:"+carNum);
        		mapData.put("\"mobi_num\"", "\""+mobile+"\"");//用户电话号码
        		mapData.put("\"set_status\"", "\""+set_status+"\"");//
        		mapData.put("\"licenseNumber\"", "\""+carNum+"\"");//车牌号
        		mapData.put("\"md_five\"", "\"itylhogiwuEDjfMK\"");//MD5的加密key=================注意的点
        		System.out.println("用户查询数据=生产sign的数据是："+mapData.toString());
        		String md5Str = MD5Utils.getMD5Str(mapData.toString());//MD5加密
        		mapData.put("\"sign\"", "\""+md5Str+"\"");//用于DES加密的sign
        		mapData.remove("\"md_five\"");
        		//加密
        		String sf_encrypt_Str = DESUtils.encrypt(mapData.toString());
        		logger.info("---------------setDefenceTest----------encrypt_Str:"+sf_encrypt_Str);
        		
                map.put("data", sf_encrypt_Str);
                String encode = "utf8";
                HttpRequestUtils instance = new HttpRequestUtils();
                String result = instance.sendHttpClientPost(path, map, encode);
                logger.info("----------setDefenceTest-----result----------"+result);
                String resultAfterDecrypt = DESUtils.decrypt(result);//"Qia0wVT6+gGqDvNHi6qVoHljL16CORbw4afSJ+h2Mv+jwjammp0T2GgCyeZIuEQe"
                logger.info("----------setDefenceTest-----resultAfterDecrypt----------"+resultAfterDecrypt);
                if(resultAfterDecrypt.indexOf("true")>0){
            		JSONObject strjsonObject = JSONObject.fromObject(resultAfterDecrypt);
            		Map<String, Object> map1Json = new HashMap<String, Object>();
            		map1Json = JSONObject.fromObject(strjsonObject);
            		String lastaddr = map1Json.get("lastaddr").toString();
            		logger.info("------setDefenceTest---------lastaddr1----------"+map1Json.get("lastaddr").toString());
            		message.setRes(lastaddr==null?"":lastaddr);
                	CarNumber carNumber = new CarNumber();
                	carNumber.setCarNum(carNum);
                	carNumber.setDefenceStatus(Integer.valueOf(set_status));
                	carNumberService.updateByNum(carNumber);
                	message.setCode(1);
					message.setMsg("车辆"+carNum+defenceOperation+"成功"+",lastaddr:"+lastaddr);
                }else{
                	message.setCode(0);
					message.setMsg("车辆"+carNum+defenceOperation+"失败");
                }
		} catch (Exception e) {
			message.setCode(0);
			message.setMsg(e.getMessage());
		}
		return message;
	}
	
	@RequestMapping(value = "postLocationData.do", method = RequestMethod.POST)
	@ResponseBody
	@Transactional
	public GeneralResponse postLocationData(String carNum, String address, String lng, String lat, HttpSession sess,HttpServletRequest request,HttpServletResponse response) {
		GeneralResponse message = new GeneralResponse();
		User loginUser = (User) sess.getAttribute("loginUser");
        boolean test=false;
        if(test||"test".equals(loginUser.getUserName())){
        	message.setCode(1);
			return message;
        }
		try {
                String path = "http://wx.baojutong.com/poststatus";
                Map<String, String> map = new HashMap<String, String>();
                Map<String, Object> mapData = new HashMap<String, Object>();
        		mapData = new HashMap<String, Object>();
        		mapData.put("\"mobi_num\"", "\""+loginUser.getMobile()+"\"");//用户电话号码
        		mapData.put("\"licenseNumber\"", "\""+carNum+"\"");//车牌号
        		mapData.put("\"alert_addr\"", "\""+address+"\"");//车辆最新位置
        		mapData.put("\"longitude\"", "\""+lng+"\"");//坐标
        		mapData.put("\"latitude\"", "\""+lat+"\"");//坐标
        		System.out.println("postLocationData的数据是："+mapData.toString());
        		//加密
        		String sf_encrypt_Str = DESUtils.encrypt(mapData.toString());
                map.put("data", sf_encrypt_Str);
                String encode = "UTF-8";
                HttpRequestUtils instance = new HttpRequestUtils();
                String result = instance.sendHttpClientPost(path, map, encode);
                logger.info("---------------result----------"+result);
                String resultAfterDecrypt = result;//DESUtils.decrypt(
                logger.info("---------------resultAfterDecrypt----------"+resultAfterDecrypt);
                if(resultAfterDecrypt.indexOf("true")>0){
//                	CarNumber carNumber = new CarNumber();
//                	carNumber.setCarNum(carNum);
//                	carNumberService.updateByNum(carNumber);
                	message.setCode(1);
                }else{
                	message.setCode(0);
                }
		} catch (Exception e) {
			message.setCode(0);
			message.setMsg(e.getMessage());
		}
		return message;
	}
}
