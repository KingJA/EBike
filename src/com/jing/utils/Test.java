package com.jing.utils;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Test {

	/**
	 * @param args
	 * @throws UnsupportedEncodingException 
	 */
	public static void main(String[] args) throws UnsupportedEncodingException {
//		String url = "register";
//		String requestUrl = "/mobile/register_two";
//		if(requestUrl.toLowerCase().indexOf(url)!=(-1)){
//			System.out.println("!=index:"+requestUrl.toLowerCase().indexOf(url));
//		}else{
//			System.out.println("==index:"+requestUrl.toLowerCase().indexOf(url));
//		}
		String a = "æµè¯AA";
		String s = a;
		s = new String(a.getBytes("GBK"),"8859_1");
		System.out.println(s);
		s = new String(a.getBytes(),"UTF-8");
		System.out.println(s);
		s = new String(a.getBytes("iso8859_1"),"UTF-8");
		System.out.println(s);
		
		s = new String(a.getBytes("GBK"),"UTF-8");
		System.out.println(s);
		s = new String(a.getBytes("GBK"),"UTF-8");
		System.out.println(s);
		
        String utf8 = new String(s.getBytes( "UTF-8"));   
        System.out.println(utf8);   
        String unicode = new String(utf8.getBytes(),"UTF-8");    
        System.out.println(unicode);   
        String gbk = new String(unicode.getBytes("GBK"));   
            
        System.out.println(gbk);  
	}

}
