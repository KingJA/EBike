package com.jing.utils;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URL;

import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

public class Base64Image {
	public static void main(String[] args) {
		System.out.println(Base64Image.getImageStr("http://localhost:8080/upload/image/20150505/20150505165730_228.jpg"));
	}
    public static String getImageStr(String imgFilePath) {
    	// 将图片文件转化为字节数组字符串，并对其进行Base64编码处理        
    	byte[] data = null;                // 读取图片字节数组        
    	InputStream in = null;
    	try {
    		URL url = new URL(imgFilePath);
    		in = url.openStream();
    		data = new byte[in.available()];
    		in.read(data);
        	// 对字节数组Base64编码        
        	BASE64Encoder encoder = new BASE64Encoder();
        	return encoder.encode(data);
    	} catch (IOException e) {
    		e.printStackTrace();
    	}finally{
    		try {
				in.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
    	}
    	return "";
    	// 返回Base64编码过的字节数组字符串    
    }
    public static boolean generateImage(String imgStr, String imgFilePath) {// 对字节数组字符串进行Base64解码并生成图片
    	if (imgStr == null) // 图像数据为空
    		return false;        
    	BASE64Decoder decoder = new BASE64Decoder();
    	try {            // Base64解码
    		byte[] bytes = decoder.decodeBuffer(imgStr);
    		for (int i = 0; i < bytes.length; ++i) {
    			if (bytes[i] < 0) {// 调整异常数据                    
    				bytes[i] += 256;
    			}            
    		}           
    		// 生成jpeg图片            
    		OutputStream out = new FileOutputStream(imgFilePath);
    		out.write(bytes);            
    		out.flush();
    		out.close(); 
    		return true;
    		} catch (Exception e) {
    			return false;
    		}    
    	}
    
}
