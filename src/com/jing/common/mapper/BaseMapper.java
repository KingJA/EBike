package com.jing.common.mapper;

import java.util.List;
/**
 * 
 * @author cbb
 * 
 */
public interface BaseMapper {
	Object getById(String id);

	@SuppressWarnings("rawtypes")
	List getByAll();

	int insert(Object object);

	void deleteById(String id);
	
}
