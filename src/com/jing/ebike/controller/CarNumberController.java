package com.jing.ebike.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jing.common.model.GeneralResponse;
import com.jing.ebike.model.CarNumber;
import com.jing.ebike.service.CarNumberService;

@Controller
@RequestMapping(value="carNumber")
public class CarNumberController {
	@Resource
	private CarNumberService carNumberService;
	
	@RequestMapping(value = "updateCarNumber", method = RequestMethod.POST)
	@Transactional
	public @ResponseBody
	GeneralResponse updateCarNumber(String id, HttpSession session)  throws Exception {
		GeneralResponse res = new GeneralResponse();
		if(session.getAttribute("userId")==null){
			res.setCode(0);
			res.setMsg("用户未登录");
		}else{
			CarNumber oldCarNumber = carNumberService.getById(id);
			if(oldCarNumber==null){
				res.setCode(0);
				res.setMsg("无效的车牌号码");
			}else{
				String userId = session.getAttribute("userId").toString();
				CarNumber carNumber = new CarNumber();
				carNumber.setId(id);
				carNumber.setUserId(userId);
				carNumber.setUseTime(new java.util.Date());
				carNumberService.update(carNumber);
				res.setCode(1);
				session.setAttribute("carNumber", oldCarNumber.getCarNum());
			}
		}
		return res;
	}
	
	@RequestMapping(value = "loadCarNumbers", method = RequestMethod.POST)
	public @ResponseBody
	GeneralResponse loadCarNumbers(Integer page,String userId)  throws Exception {
		GeneralResponse res = new GeneralResponse();
		page = (page-1)*10;
		List<CarNumber> carNumbers = carNumberService.getAvailableCarNumbers(page);
		if(carNumbers!=null && carNumbers.size()>0){
			res.setCode(1);
			res.setRes(carNumbers);
		}else{
			res.setCode(0);
		}
		return res;
	}
}
