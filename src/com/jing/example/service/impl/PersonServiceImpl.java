package com.jing.example.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import com.jing.common.page.PageView;
import com.jing.example.mapper.PersonMapper;
import com.jing.example.model.Person;
import com.jing.example.service.PersonService;
/**
 * 
 * @author cbb
 *
 */
@Service(value = "personService")
public class PersonServiceImpl implements PersonService{
	@Resource
	private PersonMapper personMapper;
	public Person getById(String id) {
		return (Person) personMapper.getById(id);
	}
	@Override
	public void deleteById(String id) {
		personMapper.deleteById(id);
	}

	@SuppressWarnings("unchecked")
	public List<Person> getByAll() {
		return personMapper.getByAll();
	}
	@Override
	public int insert(Object object) {
		return personMapper.insert(object);
	}

	@Override
	public PageView query(PageView pageView, Person person) {
		List<Person> list = personMapper.query(person);
		pageView.setRecords(list);
		return pageView;
	}

	@Override
	public void update(Person person) {
		personMapper.update(person);
	}

	@Override
	public ModelMap queryMap(PageView pageView, Person person) {
		Map<Object, Object> map = new HashMap<Object, Object>();
		map.put("paging", pageView);
		map.put("t", person);
		List<Person> rows = personMapper.queryPageMap(map);
		ModelMap modelMap = new ModelMap();
		modelMap.addAttribute("records", rows);
		modelMap.addAttribute("sEcho", pageView.getsEcho());
		modelMap.addAttribute("iTotalRecords", pageView.getRowCount());
		modelMap.addAttribute("iTotalDisplayRecords", pageView.getRowCount());
		modelMap.addAttribute("sStatus", "OK");
		return modelMap;
	}



}
