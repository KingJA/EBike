package com.jing.example.mapper;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.jing.common.mapper.BaseMapper;
import com.jing.example.model.Person;
/**
 * 
 * @author cbb
 *
 */
@Repository("personMapper")
public interface PersonMapper extends BaseMapper{

	List<Person> query(Person person);

	void update(Person person);

	List<Person> queryPageMap(Map<Object, Object> map);
	
}
