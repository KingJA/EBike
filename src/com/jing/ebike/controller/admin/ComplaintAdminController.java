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
import com.jing.ebike.model.Complaint;
import com.jing.ebike.model.User;
import com.jing.ebike.service.ComplaintService;

@Controller
@RequestMapping(value="backendcomplaint")
public class ComplaintAdminController {
	@Resource
	private ComplaintService complaintService;
	
	@RequestMapping("complaintManagement")
	public ModelAndView complaintManagement(HttpServletRequest request,Model model) {
		ModelAndView mv = new ModelAndView();
		String activeTab = (request.getParameter("activeTab") == null ? "" : request.getParameter("activeTab"));
		if(activeTab != null && activeTab != "") {
			model.addAttribute("activeTab", activeTab);
		}else {
			model.addAttribute("activeTab", "tab_0");
		}
		mv.setViewName("/backend/complaint/complaintManagement");      
		return mv;
	}
	
	@RequestMapping(value = "queryComplaintMap", method = RequestMethod.POST)
	public @ResponseBody
	ModelMap queryComplaintMap( PageView pageView,Complaint complaint,HttpSession session)  throws Exception {
		ModelMap resultMap = new ModelMap();
		resultMap = complaintService.queryComplaintMap(pageView, complaint);
		return resultMap;
	}
	
	@RequestMapping("getComplaint")
	public ModelAndView getComplaint(String id,HttpServletRequest request){
		Complaint complaint = (Complaint) complaintService.getById(id);
		ModelAndView mv = new ModelAndView("/backend/complaint/complaintAction");
		mv.addObject("complaint",complaint);
		return mv;
	}
	
	@RequestMapping(value = "updateComplaint", method = RequestMethod.POST)
	public String updateComplaint(@ModelAttribute("complaint") Complaint complaint, HttpSession session){
		complaintService.update(complaint);
		return "redirect:/backendcomplaint/complaintManagement";
	}
	
}
