package com.jing.common.mapper;

import java.util.List;

import com.jing.common.model.Dict;
import com.jing.common.model.DictCategory;
/**
 * 
 * @author cbb
 *
 */
public interface DictionaryMapper extends BaseMapper{

	List<DictCategory> getByAllDicts();

	List<Dict> getDataByDictId(Integer dictId);

	Dict getById(Integer id);

	void deleteById(Integer id);
	
	int update(Object object);
}
