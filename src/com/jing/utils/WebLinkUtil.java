package com.jing.utils;

import java.io.IOException;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.ProtocolException;
import java.net.URL;

import org.apache.commons.io.IOUtils;


public class WebLinkUtil {
	private String ak="IziMPMRD304kLEOOOYxxGZHN";//百度地图的AK 密钥
	public String web(String urls,String path,boolean boo){
		if(boo){
			path = path+"&ak="+ak;
		}
		URL url = null;
		try {
			 url = new URL(urls);
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		HttpURLConnection con = null;
		try {
			con = (HttpURLConnection) url.openConnection();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		con.setDoInput(true);
		con.setDoOutput(true);
		con.setConnectTimeout(30 * 1000);
		con.setReadTimeout(30 * 1000);
		try {
			con.setRequestMethod("POST");
		} catch (ProtocolException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		con.setUseCaches(false);
		try {
			con.connect();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			return null;
		} // 连接服务器
		String jsonRequest = null; 
		try {
			OutputStream out = con.getOutputStream();
			out.write(path.getBytes());
			out.flush();
			out.close();
			if (con.getResponseCode() == HttpURLConnection.HTTP_OK) {
				try {
					 jsonRequest = IOUtils.toString(con.getInputStream(), "UTF-8");
				} catch (IOException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return jsonRequest;
	}
}
