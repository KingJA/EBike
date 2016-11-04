package com.jing.utils;


public class SecurityCode {

	public static String getSecurityCode() {
		// 随机抽取4个字符
		int len = 4;
		// 字符集合
		char[] codes = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9' };
		// 字符集合长度
		int n = codes.length;

		// 存放抽取出来的字符
		char[] result = new char[len];

		// 判断能否出现重复的字符

		for (int i = 0; i < result.length; i++) {
			// 索引 0 and n-1
			int r = (int) (Math.random() * n);
			// 将result中的第i个元素设置为codes[r]存放的数值
			result[i] = codes[r];
		}
		return String.valueOf(result);
	}

}
