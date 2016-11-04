package com.jing.utils;

import java.util.Map;

public class MapUtils {

	public static String mapToString(Map<String,?> map){
		if(map!=null){
			String s = "";
			for (String key : map.keySet()) {
				   System.out.println("key= "+ key + " and value= " + map.get(key));
				 s += key+"["+map.get(key)+"],";
			}
			return s;
		}else return "map is null";
	}
}
