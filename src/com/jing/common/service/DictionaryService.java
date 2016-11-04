package com.jing.common.service;

import java.util.List;
import java.util.Map;

import com.jing.common.model.Dict;
import com.jing.common.model.DictCategory;


/**
 * 
 * @author cbb
 *
 */
public interface DictionaryService{
	public Dict getById(Integer id);

	public List<DictCategory> getByAllDicts();

	public List<Dict> getDataByDictId(Integer dictId);

	public String getDictValueByKey(String code, String key);

	public Map<String, String> getDictionary(String code);
	
	public void deleteById(Integer id);
	
	 int insert(Object object);

	public List<Dict> getByAll();

	public void update(Dict dict);
}
