package com.jing.common.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jing.common.model.Dict;
import com.jing.common.model.DictCategory;
import com.jing.common.service.DictionaryService;

/**
 * 
 * @author cbb
 *
 */
@Controller
public class DictController {
	@Resource
	private DictionaryService dictionaryService;
	List<DictCategory> dicts;
	List<Dict> datas;
	Dict dicData;
	@RequestMapping("/backenddict/index")
	public ModelAndView index(Model model,HttpServletRequest request){
//		Map map = Dictionary.getDictionary("1");
//		String value = Dictionary.getDictValuebyKey("1", "1");
		dicts = dictionaryService.getByAllDicts();
		model.addAttribute("dicts", dicts);
		Integer dictId = null;
		Integer dataId = null;
		if(request.getParameter("dataId")!=null) dataId = Integer.valueOf(request.getParameter("dataId"));
		if(request.getParameter("dictId")!=null) dictId = Integer.valueOf(request.getParameter("dictId"));
		if(dataId!=null){
			dicData = dictionaryService.getById(dataId);
			model.addAttribute("dicData", dicData);
		}
		if(dicData!=null){
			dictId=dicData.getCategoryId();
		}
		if(dictId==null){
			if(dicts!=null && dicts.size()>0){
				dictId=dicts.get(0).getId();
			}
		}
		datas = dictionaryService.getDataByDictId(dictId);
		model.addAttribute("datas", datas);
		model.addAttribute("dictId", dictId);
		return new ModelAndView("/backend/dict/index");
	}
	

	@RequestMapping("/backenddict/new")
	public ModelAndView add() {
		return new ModelAndView("/backend/dict/new");
	}
	@SuppressWarnings("unused")
	@RequestMapping(value = "/backenddict/search", method = RequestMethod.POST)
	public @ResponseBody String search(Model model,HttpServletRequest request) {
		Integer dictId = null;
		Integer dataId = null;
		if(request.getParameter("dataId")!=null) dataId = Integer.valueOf(request.getParameter("dataId"));
		if(request.getParameter("dictId")!=null) dictId = Integer.valueOf(request.getParameter("dictId"));
		datas = dictionaryService.getDataByDictId(dictId);
		JSONArray json = new JSONArray();
		JSONObject jo = new JSONObject();
		for(int i=0;i<datas.size();i++){
			jo.put("id", datas.get(i).getId());
			jo.put("code", datas.get(i).getCode());
			jo.put("categoryId", datas.get(i).getCategoryId());
			jo.put("dictDesc", datas.get(i).getDictDesc());
			json.add(jo);
		}
		
		return json.toString();
	}
	@RequestMapping(value = "/backenddict/updates", method = RequestMethod.POST)
	public @ResponseBody String updates(Model model,HttpServletRequest request) {
		Integer id = null;
		if(request.getParameter("id")!=null) id = Integer.valueOf(request.getParameter("id"));
		dicData = dictionaryService.getById(id);
		JSONArray json = new JSONArray();
		JSONObject jo = new JSONObject();
			jo.put("id",dicData.getId());
			jo.put("code", dicData.getCode());
			jo.put("categoryId", dicData.getCategoryId());
			jo.put("dictDesc", dicData.getDictDesc());
			json.add(jo);
		
		return json.toString();
	}
	@RequestMapping(value = "/backenddict/save", method = RequestMethod.POST)
	public @ResponseBody String saveInfo(@ModelAttribute("dicData") Dict dict) {
		Map<String, Object> modelMap = new HashMap<String, Object>();
		if (dict.getCode() == null) {
			modelMap.put("error", "true");
		}
		if("".equals(dict.getId())||dict.getId()==null){
			dictionaryService.insert(dict);
		}else {
			dictionaryService.update(dict);
		}
		datas = dictionaryService.getDataByDictId(dict.getCategoryId());
		modelMap.put("success", "true");
		JSONArray json = new JSONArray();
		JSONObject jo = new JSONObject();
		for(int i=0;i<datas.size();i++){
			jo.put("id", datas.get(i).getId());
			jo.put("code", datas.get(i).getCode());
			jo.put("categoryId", datas.get(i).getCategoryId());
			jo.put("dictDesc", datas.get(i).getDictDesc());
			json.add(jo);
		}
		
		return json.toString();
	}

	@RequestMapping(value = "/backenddict/delete", method = RequestMethod.POST)
	public @ResponseBody String delete(@RequestParam("id") Integer id) {
		Map<String, Object> modelMap = new HashMap<String, Object>();
		dictionaryService.deleteById(id);
		JSONArray json = new JSONArray();
		JSONObject jo = new JSONObject();
		jo.put("success", 1);
		json.add(jo);
		modelMap.put("success", "true");
		return json.toString();
		//return "redirect:/dict/list";
	}

	public List<DictCategory> getDicts() {
		return dicts;
	}

	public void setDicts(List<DictCategory> dicts) {
		this.dicts = dicts;
	}

	public List<Dict> getDatas() {
		return datas;
	}

	public void setDatas(List<Dict> datas) {
		this.datas = datas;
	}

	public Dict getDicData() {
		return dicData;
	}

	public void setDicData(Dict dicData) {
		this.dicData = dicData;
	}
}
