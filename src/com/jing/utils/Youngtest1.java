package com.jing.utils;

import java.util.HashMap;
import java.util.Map;

import net.sf.json.JSONObject;

public class Youngtest1 {
	private static Map<String, Object> mapData = new HashMap<String, Object>();
	/**
	 * @param args
	 * @throws Exception 
	 */
	public static void main(String[] args) throws Exception {
		// TODO Auto-generated method stub
		
		
		/*******************用户查询数据请求接口例子==开始**************************/
		mapData = new HashMap<String, Object>();
		mapData.put("\"mobi_num\"", "\"18358924840\"");//手机号
		mapData.put("\"id_six\"", "\"112411\"");//身份证后六位
		mapData.put("\"md_five\"", "\"itylhogiwuEDjfMK\"");//MD5的加密key
		String md5Str = MD5Utils.getMD5Str(mapData.toString());//MD5加密
		mapData.put("\"sign\"", "\""+md5Str+"\"");//用于DES加密的sign
		
		//加密
		String encrypt_Str = DESUtils.encrypt(mapData.toString());
		//解密
		String decrypt_Str = DESUtils.decrypt(encrypt_Str);
		System.out.println("用户查询数据=加密前："+mapData.toString());
		System.out.println("用户查询数据=加密后："+encrypt_Str);
		System.out.println("用户查询数据=解密后："+decrypt_Str);
		JSONObject jsonObject = JSONObject.fromObject(decrypt_Str);
		Map<String, Object> mapJson = new HashMap<String, Object>();
		mapJson = JSONObject.fromObject(jsonObject);
		System.out.println("sign=="+mapJson.get("sign").toString());
		/*******************用户查询数据请求接口例子==结束**************************/
		
		
		
		/*******************设防接口数据推送例子==开始**************************/
		mapData = new HashMap<String, Object>();
		mapData.put("\"mobi_num\"", "\"34343242\"");
		mapData.put("\"licenseNumber\"", "\"YK343242\"");
		mapData.put("\"alert_addr\"", "\"范德萨范德萨\"");
		mapData.put("\"longitude\"", "\"120.4324324\"");
		mapData.put("\"latitude\"", "\"29.45455434\"");
		//加密
		String sf_encrypt_Str = DESUtils.encrypt(mapData.toString());
		//解密
		String sf_decrypt_Str = DESUtils.decrypt(sf_encrypt_Str);
		System.out.println("设防接口数据推送例子=加密前："+mapData.toString());
		System.out.println("设防接口数据推送例子=加密后："+sf_encrypt_Str);
		System.out.println("设防接口数据推送例子=解密后："+sf_decrypt_Str);
		
		
		/*******************设防接口数据推送例子==结束**************************/
	}

	
}
