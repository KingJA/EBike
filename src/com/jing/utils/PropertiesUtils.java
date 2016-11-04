package com.jing.utils;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class PropertiesUtils {
	private static PropertiesUtils pro = null;
	private Properties props = null;
	private  PropertiesUtils(){
		props = new Properties();
		InputStream inputStream = this.getClass().getClassLoader()
				.getResourceAsStream("jingzhi.properties");
		try {
			props.load(inputStream);
			inputStream.close();
		} catch (IOException e1) {
			e1.printStackTrace();
		}
	}
	public PropertiesUtils(String file) {
		props = new Properties();
		InputStream inputStream = this.getClass().getClassLoader()
				.getResourceAsStream(file);
		try {
			props.load(inputStream);
			inputStream.close();
		} catch (IOException e1) {
			e1.printStackTrace();
		}
	}
	public static PropertiesUtils getInstance( ){
		if(pro==null){
			pro = new PropertiesUtils();
		}
		return pro;
	}
	public static PropertiesUtils getInstance(String file){
		if(pro==null){
			pro = new PropertiesUtils(file);
		}
		return pro;
	}
	public String getProperties(String key){
		String value = props.getProperty(key);
		return value;
	}
}
