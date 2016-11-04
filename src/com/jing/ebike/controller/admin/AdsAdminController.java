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
import com.jing.ebike.model.Ads;
import com.jing.ebike.service.AdsService;
import com.jing.utils.ChineseTransferUtil;
import com.jing.utils.UUIDUtils;

@Controller
@RequestMapping(value="backendads")
public class AdsAdminController {
	@Resource
	private AdsService adsService;
	
	@RequestMapping("adsManagement")
	public ModelAndView adsManagement(HttpServletRequest request,Model model) {
		ModelAndView mv = new ModelAndView();
		String activeTab = (request.getParameter("activeTab") == null ? "" : request.getParameter("activeTab"));
		if(activeTab != null && activeTab != "") {
			model.addAttribute("activeTab", activeTab);
		}else {
			model.addAttribute("activeTab", "tab_0");
		}
		mv.setViewName("/backend/ads/adsManagement");      
		return mv;
	}
	
	@RequestMapping(value = "queryMap", method = RequestMethod.POST)
	public @ResponseBody
	ModelMap query( PageView pageView,Ads ads,HttpSession session)  throws Exception {
		ModelMap resultMap = new ModelMap();
		resultMap = adsService.queryAdsMap(pageView, ads);
		return resultMap;
	}
	
	@RequestMapping("newAds")
	public ModelAndView addAds(Model model) {
		model.addAttribute("doType", "add");
		return new ModelAndView("/backend/ads/adsAction");
	}

	@RequestMapping(value = "saveAds", method = RequestMethod.POST)
	public String saveCarNumber(@ModelAttribute("ads") Ads ads, HttpSession session) {
		ads.setId(UUIDUtils.generateUUID());
		ads.setCreateTime(new Date());
		ads.setAdName(ChineseTransferUtil.transformKindEditor(ads.getAdName()));
		adsService.insert(ads);
		return "redirect:/backendads/adsManagement";
	}
	
	@RequestMapping("getAds")
	public ModelAndView getCarNumber(String id,HttpServletRequest request){
		Ads ads = (Ads) adsService.getById(id);
		ModelAndView mv = new ModelAndView("/backend/ads/adsAction");
		mv.addObject("doType", "edit");
		mv.addObject("ads",ads);
		return mv;
	}
	
	@RequestMapping(value = "updateAds", method = RequestMethod.POST)
	public String updateCarNumber(@ModelAttribute("ads") Ads ads, HttpSession session){
		adsService.update(ads);
		return "redirect:/backendads/adsManagement";
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
			adsService.deleteById(id);
			modelMap.put("success", "true");
		} catch (Exception e) {
			modelMap.put("error", "true");
			e.printStackTrace();
		}  finally {

		}
		return modelMap;
	}
}
