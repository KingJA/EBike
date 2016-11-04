package com.jing.example.controller;

import java.util.HashMap;
import java.util.List;
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
import com.jing.example.model.Person;
import com.jing.example.service.PersonService;
import com.jing.utils.Common;
import com.jing.utils.UUIDUtils;


/**
 * 
 * @author cbb
 *
 */
@Controller
public class PersonController {
	@Resource
	private PersonService personService;

	@RequestMapping("/backendperson/personManagement")
	public ModelAndView personManagement(HttpServletRequest request,Model model) {
		ModelAndView mv = new ModelAndView();
		String activeTab = (request.getParameter("activeTab") == null ? "" : request.getParameter("activeTab"));
		if(activeTab != null && activeTab != "") {
			model.addAttribute("activeTab", activeTab);
		}else {
			model.addAttribute("activeTab", "tab_0");
		}
		mv.setViewName("/backend/person/personManagement");      
		return mv;
	}
	@RequestMapping(value = "/backendperson/query")
	public @ResponseBody
	PageView query( Model model,Person person,String pageNow,HttpSession session)  throws Exception {
//		User loginUser = (User) session.getAttribute("loginUser");
//		if(loginUser==null) return null;
		//car.setPersonId(loginUser.getPersonId()==null ? 1 : loginUser.getPersonId());
		PageView pageView = null;
		if (Common.isEmpty(pageNow)) {
			pageView = new PageView(1);
		} else {
			pageView = new PageView(Integer.parseInt(pageNow));
		}
		pageView = personService.query(pageView, person);
		return pageView;
	}
	
	@RequestMapping(value = "/backendperson/queryMap", method = RequestMethod.POST)
	public @ResponseBody
	ModelMap query( PageView pageView,Person person,HttpSession session)  throws Exception {
//		User loginUser = (User) session.getAttribute("loginUser");
		ModelMap resultMap = new ModelMap();
		resultMap = personService.queryMap(pageView, person);
		return resultMap;
	}
	
	@RequestMapping(value = "/backendperson/queryList")
	public @ResponseBody
	List<Person> queryList()  throws Exception {
		//car.setPersonId(loginUser.getPersonId()==null ? 1 : loginUser.getPersonId());
		@SuppressWarnings("unchecked")
		List<Person> persons = personService.getByAll();
		return persons;
	}
	
	@RequestMapping("/backendperson/new")
	public ModelAndView add(Model model) {
		model.addAttribute("doType", "add");
		return new ModelAndView("/backend/person/PersonAction");
	}

	@RequestMapping(value = "/backendperson/save", method = RequestMethod.POST)
	public String saveInfo(@ModelAttribute("person") Person person, HttpSession session) {
		if (person.getName() == null || person.getName() == "") {
			return "redirect:/error";
		}
//		User loginUser = (User) session.getAttribute("loginUser");
		person.setId(UUIDUtils.generateUUID());
		personService.insert(person);
		return "redirect:/person/personManagement";
	}
	
	@RequestMapping(value = "/backendperson/delete", method = RequestMethod.POST)
	public @ResponseBody
	Map<String, Object> delete(String id,HttpSession session,HttpServletRequest request) {
		Map<String, Object> modelMap = new HashMap<String, Object>();
		try {
				personService.deleteById(id);
				modelMap.put("success", "true");
		} catch (Exception e) {
			modelMap.put("error", "true");
			e.printStackTrace();
		}  finally {

		}
		return modelMap;
	}
	
	@RequestMapping("/backendperson/get")
	public ModelAndView get(String id,HttpServletRequest request){
		Person person = (Person) personService.getById(id);
		ModelAndView mv = new ModelAndView("/backend/person/PersonAction");
//		Dictionary dict = (Dictionary)request.getSession().getServletContext().getAttribute("dict");
//		List<DictItem> statusItems = dict.getDict("25");
//		mv.addObject("statusItems", statusItems);
		mv.addObject("doType", "edit");
		mv.addObject("person",person);
		return mv;
	}
	
	@RequestMapping(value = "/backendperson/update", method = RequestMethod.POST)
	public String update(@ModelAttribute("person")Person person, HttpSession session){
//		User loginUser = (User) session.getAttribute("loginUser");
//		person.setUpdateUser(loginUser.getId());
		personService.update(person);
		return "redirect:/person/personManagement";
	}
}
