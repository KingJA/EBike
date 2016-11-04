package com.jing.utils;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.concurrent.atomic.AtomicLong;

/**
 * 生成商品编号
 * @author eclipse
 */
public class ProductNo extends Thread{ 
	private static int size = 10;  //分页大小
	private static long order = 1000;  //订单编号s
	private static String path;  //图片存储路径
	private final static AtomicLong a = new AtomicLong(1);
	public static String getImage() {
		DateFormat form = new SimpleDateFormat("yyyyMMddHHmmss");
		String d = form.format(Calendar.getInstance().getTime());
		long s = a.incrementAndGet();
		if(s==99999){
			a.set(1);
		}
		String image = String.valueOf(d)+s+".jpg";
		return image;
	}
	public static long getOrder() {
		order++;
		return order;
	}
	public static void setOrder(long order) {
		ProductNo.order = order;
	}
	public static String getPath() {
		return path;
	}
	public static void setPath(String path) {
		
		ProductNo.path = path;
	}
	public static int getSize(){
		return size;
	}
	public void s(){
		
	}
}
