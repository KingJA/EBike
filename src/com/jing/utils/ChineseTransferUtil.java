package com.jing.utils;

import java.io.UnsupportedEncodingException;

public class ChineseTransferUtil {
	
	public static String transformKindEditor(String original){
		try {
			return new String(original.getBytes("ISO8859_1"),"UTF-8");
		} catch (UnsupportedEncodingException e) {
			return original;
		}
	}
	
	 public static String gbToUtf8(String str) throws UnsupportedEncodingException {   
	        StringBuffer sb = new StringBuffer();   
	        for (int i = 0; i < str.length(); i++) {   
	            String s = str.substring(i, i + 1);   
	            if (s.charAt(0) > 0x80) {   
	                byte[] bytes = s.getBytes("Unicode");   
	                String binaryStr = "";   
	                for (int j = 2; j < bytes.length; j += 2) {   
	                    // the first byte   
	                    String hexStr = getHexString(bytes[j + 1]);   
	                    String binStr = getBinaryString(Integer.valueOf(hexStr, 16));   
	                    binaryStr += binStr;   
	                    // the second byte   
	                    hexStr = getHexString(bytes[j]);   
	                    binStr = getBinaryString(Integer.valueOf(hexStr, 16));   
	                    binaryStr += binStr;   
	                }   
	                // convert unicode to utf-8   
	                String s1 = "1110" + binaryStr.substring(0, 4);   
	                String s2 = "10" + binaryStr.substring(4, 10);   
	                String s3 = "10" + binaryStr.substring(10, 16);   
	                byte[] bs = new byte[3];   
	                bs[0] = Integer.valueOf(s1, 2).byteValue();   
	                bs[1] = Integer.valueOf(s2, 2).byteValue();   
	                bs[2] = Integer.valueOf(s3, 2).byteValue();   
	                String ss = new String(bs, "UTF-8");   
	                sb.append(ss);   
	            } else {   
	                sb.append(s);   
	            }   
	        }   
	        return sb.toString();   
	    }   
	  
	    private static String getHexString(byte b) {   
	        String hexStr = Integer.toHexString(b);   
	        int m = hexStr.length();   
	        if (m < 2) {   
	            hexStr = "0" + hexStr;   
	        } else {   
	            hexStr = hexStr.substring(m - 2);   
	        }   
	        return hexStr;   
	    }   
	  
	    private static String getBinaryString(int i) {   
	        String binaryStr = Integer.toBinaryString(i);   
	        int length = binaryStr.length();   
	        for (int l = 0; l < 8 - length; l++) {   
	            binaryStr = "0" + binaryStr;   
	        }   
	        return binaryStr;   
	    } 
	public static void main(String[] args) throws UnsupportedEncodingException {
		
		String s = "7号基站";
		 System.out.println(s);//1

//	       System.out.println(s.getBytes());//2
//
//	       System.out.println(s.getBytes("GB2312"));//3
//
//	       System.out.println(s.getBytes("ISO8859_1"));//4
//
//	       System.out.println(new String(s.getBytes()));//5
//
//	       System.out.println(new String(s.getBytes(),"GB2312"));//6
//
//	       System.out.println(new String(s.getBytes("GBK"),"ISO8859_1"));//7

	       System.out.println(new String(s.getBytes("GBK"),"UTF-8"));//8
//
//	       System.out.println(new String(s.getBytes("GBK"),"UTF-8"));//9
//
//	       System.out.println(new String(s.getBytes("GB2312"),"ISO8859_1"));//10
//
//	       System.out.println(new String(s.getBytes("ISO8859_1")));//11
//
//	       System.out.println(new String(s.getBytes("ISO8859_1"),"GB2312"));//12
//
//	       System.out.println(new String(s.getBytes("ISO8859_1"),"UTF-8"));//13

	}
}
