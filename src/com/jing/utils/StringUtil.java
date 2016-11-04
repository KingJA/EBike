package com.jing.utils;

public class StringUtil {

	public static boolean notNullOrEmpty(String s){
		if(s != null && s.trim().length()!=0){
			return true;
		}
		return false;
	}
	
	public static boolean isNullOrEmpty(String s){
		return !StringUtil.notNullOrEmpty(s);
	}
}
