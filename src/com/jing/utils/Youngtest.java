package com.jing.utils;

import java.util.HashMap;
import java.util.Map;

import net.sf.json.JSONObject;


public class Youngtest {
	private static Map<String, Object> mapData = new HashMap<String, Object>();
	/**
	 * @param args
	 * @throws Exception 
	 */
	public static void main(String[] args) throws Exception {
		// TODO Auto-generated method stub
		
		
//		/*******************用户查询数据请求接口例子==开始**************************/
//		mapData = new HashMap<String, Object>();
//		mapData.put("\"mobi_num\"", "\"13758727986\"");//手机号
//		mapData.put("\"id_six\"", "\"812144\"");//身份证后六位
//		mapData.put("\"licenseNumber\"", "\"CS000032\"");//身份证后六位
//		mapData.put("\"md_five\"", "\"itylhogiwuEDjfMK\"");//MD5的加密key=================注意的点
//		System.out.println("用户查询数据=生产sign的数据是："+mapData.toString());
//		String md5Str = MD5Utils.getMD5Str(mapData.toString());//MD5加密
//		mapData.put("\"sign\"", "\""+md5Str+"\"");//用于DES加密的sign
//		
//		mapData.remove("\"md_five\"");
//		
//		//加密
//		String encrypt_Str = DESUtils.encrypt(mapData.toString());
//		//解密
//		String decrypt_Str = DESUtils.decrypt(encrypt_Str);
//		System.out.println("用户查询数据=加密前："+mapData.toString());
//		System.out.println("用户查询数据=加密后："+encrypt_Str);
//		System.out.println("用户查询数据=解密后："+decrypt_Str);
//		JSONObject jsonObject = JSONObject.fromObject(decrypt_Str);
//		Map<String, Object> mapJson = new HashMap<String, Object>();
//		mapJson = JSONObject.fromObject(jsonObject);
//		System.out.println("sign=="+mapJson.get("sign").toString());
//		/*******************用户查询数据请求接口例子==结束**************************/
//		
//		
//		
//		/*******************设防接口数据推送例子==开始**************************/
//		mapData = new HashMap<String, Object>();
//		mapData.put("\"mobi_num\"", "\"13758727986\"");//用户电话号码
//		mapData.put("\"licenseNumber\"", "\"CS000032\"");//车牌号
//		mapData.put("\"alert_addr\"", "\"范德萨范德萨\"");//车辆最新位置
//		mapData.put("\"longitude\"", "\"120.4324324\"");//坐标
//		mapData.put("\"latitude\"", "\"29.45455434\"");//坐标
//		//加密
//		String sf_encrypt_Str = DESUtils.encrypt(mapData.toString());
//		//解密
//		String sf_decrypt_Str = DESUtils.decrypt(sf_encrypt_Str);
//		System.out.println("设防接口数据推送例子=加密前："+mapData.toString());
//		System.out.println("设防接口数据推送例子=加密后："+sf_encrypt_Str);
//		System.out.println("设防接口数据推送例子=解密后："+sf_decrypt_Str);
		
		
		/*******************设防接口数据推送例子==结束**************************/
		
//		String str="{\"userinfo\"=[{\"fortify\"=\"0\", \"idcard\"=\"360427199211112411\", \"mobile\"=\"18358924840\", \"licenseNumber\"=\"DY038537\", \"address\"=\"江西省九江市星子县横塘乡\", \"username\"=\"况衍君\", \"createtime\"=\"2016-05-25\"}], \"result\"=true}";
//		JSONObject strjsonObject = JSONObject.fromObject(str);
//		Map<String, Object> map1Json = new HashMap<String, Object>();
//		map1Json = JSONObject.fromObject(strjsonObject);
//		str = map1Json.get("userinfo").toString();
//		System.out.println(str);
//		strjsonObject = JSONObject.fromObject(str.substring(1, str.length()-1));
//		map1Json = JSONObject.fromObject(strjsonObject);
//		System.out.println("idcard=="+map1Json.get("idcard").toString());
		System.out.println(DESUtils.decrypt("Qia0wVT6+gGqDvNHi6qVoHljL16CORbw4afSJ+h2Mv+jwjammp0T2GgCyeZIuEQe"));
	}

	
}
