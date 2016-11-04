package com.jing.ebike.controller;

import java.util.List;

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
import com.jing.ebike.model.Complaint;
import com.jing.ebike.model.User;
import com.jing.ebike.service.ComplaintService;
import com.jing.utils.UUIDUtils;

@Controller
@RequestMapping(value="complaint")
public class ComplaintController {
	@Resource
	private ComplaintService complaintService;
	
	@RequestMapping("sendComplaint")
	public ModelAndView sendComplaint(Complaint complaint, HttpSession session, HttpServletRequest request,Model model) {
		ModelAndView mv = new ModelAndView();
		complaint.setCreateTime(new java.util.Date());
		complaint.setId(UUIDUtils.generateUUID());
		complaint.setStatus(0);
		User user = (User) session.getAttribute("loginUser");
		complaint.setUserId(user.getId());
		complaintService.insert(complaint);
		mv.setViewName("/frontend/index");     
		return mv;
	}
	
	@RequestMapping(value = "loadComplaints", method = RequestMethod.POST)
	public @ResponseBody
	GeneralResponse loadComplaints(Integer page,String userId)  throws Exception {
		GeneralResponse res = new GeneralResponse();
		page = (page-1)*10;
		List<Complaint> complaints = complaintService.getComplaints(page,userId);
		if(complaints!=null && complaints.size()>0){
			res.setCode(1);
			res.setRes(complaints);
		}else{
			res.setCode(0);
		}
		return res;
	}
}
