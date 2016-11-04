package com.jing.utils;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
/**
 * Date Util
 * @author cbb
 *
 */
public class DateUtil {
	public static String getDate(Object date){
		if(date==null) return "";
		SimpleDateFormat f=new SimpleDateFormat("yyyy/MM/dd");
		return f.format(date);
	}
	
	public static String getChineseDate(Object date){
		if(date==null) return "";		
		SimpleDateFormat f=new SimpleDateFormat("yyyy年MM月dd日");
		return f.format(date);
	}
	public static String getDateTime(Object date){
		if(date==null) return "";		
		SimpleDateFormat f=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		return f.format(date);
	}
	//yyyy/mm/dd
	public static Date getDate(String dateStr){
		if(dateStr==null) return null;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
		Date date = null;
		try {
			date = sdf.parse(dateStr);
			return date;
		} catch (ParseException e) {
			e.printStackTrace();
			return date;
		}
	}
	public static Date getDateTimeMin(String dateStr){
		if(dateStr==null) return null;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd hh:mm");
		Date date = null;
		try {
			date = sdf.parse(dateStr);
			return date;
		} catch (ParseException e) {
			e.printStackTrace();
			return date;
		}
	}
	public static Date getDateTime(String dateStr){
		if(dateStr==null) return null;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd hh:mm:ss");
		Date date = null;
		try {
			date = sdf.parse(dateStr);
			return date;
		} catch (ParseException e) {
			e.printStackTrace();
			return date;
		}
	}
	//yyyy-mm-dd
	public static Date getFormatDate(String dateStr){
		if(dateStr==null) return null;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = null;
		try {
			date = sdf.parse(dateStr);
			return date;
		} catch (ParseException e) {
			e.printStackTrace();
			return date;
		}
	}
	
	//yyyy-mm-dd hh:mm:ss
		public static Date getFormatDate2(String dateStr){
			if(dateStr==null) return null;
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			Date date = null;
			try {
				date = sdf.parse(dateStr);
				return date;
			} catch (ParseException e) {
				e.printStackTrace();
				return date;
			}
		}
	public static Timestamp getCurrentTimestamp(){
		Date date = new Date();
		return new Timestamp(date.getTime());
	}

	public static String getDate(Date date, String dateFormat) {
		if(date==null) return "";		
		SimpleDateFormat f=new SimpleDateFormat(dateFormat);
		return f.format(date);
	}
}
