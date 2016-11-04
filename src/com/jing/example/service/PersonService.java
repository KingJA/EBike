package com.jing.example.service;

import org.springframework.ui.ModelMap;

import com.jing.common.page.PageView;
import com.jing.common.service.BaseService;
import com.jing.example.model.Person;
/**
 * 
 * @author cbb
 *
 */
public interface PersonService extends BaseService{

	PageView query(PageView pageView, Person person);

	void update(Person person);

	ModelMap queryMap(PageView pageView, Person person);

}
