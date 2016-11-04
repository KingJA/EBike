package com.jing.common.service;

import java.util.List;
/**
 * 
 * @author cbb
 *
 */
public interface BaseService {
	public Object getById(String id);

	@SuppressWarnings("rawtypes")
	public List getByAll();

	public int insert(Object object);

	public void deleteById(String id);
	
}
