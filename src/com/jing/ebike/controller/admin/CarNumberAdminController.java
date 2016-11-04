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

import com.jing.common.model.GeneralResponse;
import com.jing.common.page.PageView;
import com.jing.ebike.model.CarNumber;
import com.jing.ebike.service.CarNumberService;
import com.jing.utils.UUIDUtils;

@Controller
@RequestMapping(value="backendcarNum")
public class CarNumberAdminController {
	@Resource
	private CarNumberService carNumberService;
	/**
	 * 用户管理
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("carNumManagement")
	public ModelAndView carNumManagement(HttpServletRequest request,Model model) {
		ModelAndView mv = new ModelAndView();
		String activeTab = (request.getParameter("activeTab") == null ? "" : request.getParameter("activeTab"));
		if(activeTab != null && activeTab != "") {
			model.addAttribute("activeTab", activeTab);
		}else {
			model.addAttribute("activeTab", "tab_0");
		}
		mv.setViewName("/backend/carNum/carNumManagement");
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
	ModelMap query( PageView pageView,CarNumber carNumber,HttpSession session)  throws Exception {
		ModelMap resultMap = new ModelMap();
		resultMap = carNumberService.queryCarNumMap(pageView, carNumber);
		return resultMap;
	}
	
	@RequestMapping("newCarNum")
	public ModelAndView addCarNum(Model model) {
		model.addAttribute("doType", "add");
		return new ModelAndView("/backend/carNum/carNumAction");
	}

	@RequestMapping(value = "saveCarNumber", method = RequestMethod.POST)
	public String saveCarNumber(@ModelAttribute("carNum") CarNumber carNumber, HttpSession session) {
		carNumber.setId(UUIDUtils.generateUUID());
		carNumber.setCreateTime(new Date());
		carNumberService.insert(carNumber);
		return "redirect:/backendcarNum/carNumManagement";
	}
	
	@RequestMapping("getCarNumber")
	public ModelAndView getCarNumber(String id,HttpServletRequest request){
		CarNumber carNumber = (CarNumber) carNumberService.getById(id);
		ModelAndView mv = new ModelAndView("/backend/carNum/carNumAction");
		mv.addObject("doType", "edit");
		mv.addObject("carNumber",carNumber);
		return mv;
	}
	
	@RequestMapping(value = "updateCarNumber", method = RequestMethod.POST)
	public String updateCarNumber(@ModelAttribute("carNumber") CarNumber carNumber, HttpSession session){
		carNumberService.update(carNumber);
		return "redirect:/backendcarNum/carNumberManagement";
	}
	
	@RequestMapping(value = "validateCarNum")
	@ResponseBody
	public boolean validateCarNum(String carNum) {
		return carNumberService.isExistCarNum(carNum);
	}
	/**
	 * 通用
	 * @param id
	 * @param session
	 * @param request
	 * @return
	 */
	
	
	@RequestMapping(value = "delete", method = RequestMethod.POST)
	public @ResponseBody
	Map<String, Object> delete(String id,HttpSession session,HttpServletRequest request) {
		Map<String, Object> modelMap = new HashMap<String, Object>();
		try {
			carNumberService.deleteById(id);
			modelMap.put("success", "true");
		} catch (Exception e) {
			modelMap.put("error", "true");
			e.printStackTrace();
		}  finally {

		}
		return modelMap;
	}
}
