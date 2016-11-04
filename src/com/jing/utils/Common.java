package com.jing.utils;

import java.util.Random;



public class Common {
	/**
	 * 判断变量是否为空
	 * 
	 * @param s
	 * @return
	 */
	public static boolean isEmpty(String s) {
		if (null == s || "".equals(s) || "".equals(s.trim()) || "null".equalsIgnoreCase(s)) {
			return true;
		} else {
			return false;
		}
	}
	
	public static int[] loadRandomThreeNum(int size){
		int[] a = new int[size];
        int[] b = new int[3];
        int n = a.length;
        Random r = new Random();
        for(int i = 0; i < a.length; i++) {
            a[i] = i;
        }
        for(int i = 0; i < b.length; i++) {
            int m = r.nextInt(n);
            b[i] = a[m];
            a[m] = a[n-1];
            n--;
        }
        return b;
	}

}
