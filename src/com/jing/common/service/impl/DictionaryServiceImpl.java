package com.jing.common.service.impl;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import com.jing.common.mapper.DictionaryMapper;
import com.jing.common.model.Dict;
import com.jing.common.model.DictCategory;
import com.jing.common.service.DictionaryService;
import com.jing.utils.DataSource;

public class DictionaryServiceImpl implements DictionaryService{
	@Resource
	private DictionaryMapper dictionaryMapper;
	public Dict getById(Integer id) {
		return (Dict) dictionaryMapper.getById(id);
	}

	@SuppressWarnings("unchecked")
	public List<Dict> getByAll() {
		return dictionaryMapper.getByAll();
	}

	public int insert(Object object) {
		return dictionaryMapper.insert(object);
	}

	public void deleteById(Integer id) {
		dictionaryMapper.deleteById(id);
	}

	public List<DictCategory> getByAllDicts() {
		return dictionaryMapper.getByAllDicts();
	}

	public List<Dict> getDataByDictId(Integer dictId) {
		return dictionaryMapper.getDataByDictId(dictId);
	}

	public String getDictValueByKey(String code, String key) {
		if (key == null || key.length() == 0) {
			return "";
		}
		
		List<Dict> list;
		// 前后加逗号，取消空格，方便替换
		String sKey = "," + key.replace(" ", "") + ",";
		// 可能需要取多个数据字典
		String[] sCodes = code.split(",");
		for (String sCode : sCodes) {
			if (DataSource.dictionaries.get(sCode) != null) {
				list = DataSource.dictionaries.get(sCode);
			} else {
				list = dictionaryMapper.getDataByDictId(Integer.valueOf(sCode));
				DataSource.dictionaries.put(sCode, list);
			}
			for (Dict dicData : list) {
				// 找到对应的字典值后进行替换
				sKey = sKey.replace("," + dicData.getCode() + ",",
						"," + dicData.getDictDesc() + ",");
			}
		}
		return sKey.substring(1, sKey.length() - 1);
	}

	public Map<String, String> getDictionary(String code) {
		Map<String, String> map = new LinkedHashMap<String, String>();
		List<Dict> dicList;
		if (DataSource.dictionaries.get(code) != null) {
			dicList = DataSource.dictionaries.get(code);
		} else {
			dicList = dictionaryMapper.getDataByDictId(Integer.valueOf(code));
			DataSource.dictionaries.put(code, dicList);
		}
		for (int i = 0; i < dicList.size(); i++) {
			map.put(dicList.get(i).getCode(), dicList.get(i).getDictDesc());
		}
		return map;
	}

	@Override
	public void update(Dict dict) {
		dictionaryMapper.update(dict);
	}
}
