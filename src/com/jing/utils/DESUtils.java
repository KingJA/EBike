package com.jing.utils;

import java.security.SecureRandom;

import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.DESKeySpec;
import javax.crypto.spec.IvParameterSpec;

import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

public class DESUtils {
	private static byte[] keys = { 1, -1, 1, -1, 1, -1, 1, -1 };
	/** 加密、解密key. */
    private static final String PASSWORD_CRYPT_KEY = "kEHrDooxWHCWtfeSxvDvgqZq";
    /** 加密算法,可用 DES,DESede,Blowfish. */
    private final static String ALGORITHM = "DES";
	
	public DESUtils(){
		
	}
	
	public static void main(String args[]) {
		//待加密内容
		String str = "{\"userinfo\"=[{\"fortify\"=\"0\", \"idcard\"=\"446754663464545456\", \"mobile\"=\"12345678912\", \"licenseNumber\"=\"DY070872\", \"address\"=\"白云街道\", \"username\"=\"程璟瑛\", \"createtime\"=\"2016-05-25 00:00:00.0\"}], \"result\"=true}";
		byte[] result = DESUtils.encrypt(str.getBytes(), PASSWORD_CRYPT_KEY.getBytes());
		System.out.println("加密后："+new String(result));
		//直接将如上内容解密
		try {
			byte[] decryResult = DESUtils.decrypt(result, PASSWORD_CRYPT_KEY.getBytes());
			System.out.println("解密后："+new String(decryResult));
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
	
	/**
     * 对用DES加密过的数据进行解密.
     * @param data 待进行DES加密的数据
     * @return 返回经过DES加密后的数据
     * @throws Exception
     */
    public final static String decrypt(String data) throws Exception {
//    	BASE64Decoder decoder = new BASE64Decoder();
//    	byte[] buf = decoder.decodeBuffer(data);
//    	byte[] bt = decrypt(buf, PASSWORD_CRYPT_KEY.getBytes());
//        return new String(bt);
        byte[] byteMing = null;
        String strMing = "";
        try {
            BASE64Decoder decoder = new BASE64Decoder();
            byteMing = decoder.decodeBuffer(data);
            byteMing = decrypt(byteMing, PASSWORD_CRYPT_KEY.getBytes());
            strMing = new String(byteMing);
        } catch (Exception e) {
            throw new RuntimeException(e);
        } finally {
            byteMing = null;
        }
        return strMing;
    }
    
    /**
     * 对数据进行DES加密.
     * @param data DES加密数据
     * @return 返回解密后的数据
     * @throws Exception
     */
    public final static String encrypt(String data) throws Exception  {
        byte[] byteMi = null;
        byte[] byteMing = null;
        String strMi = "";
        try {
            byteMing = data.getBytes("utf-8");
            byteMi = encrypt(byteMing, PASSWORD_CRYPT_KEY.getBytes());
            BASE64Encoder base64Encoder = new BASE64Encoder();
            strMi = base64Encoder.encode(byteMi);
        } catch (Exception e) {
            throw new RuntimeException(e);
        } finally {
            byteMing = null;
            byteMi = null;
        }
        return strMi;
    }
	
	/**
	* 加密
	* @param datasource byte[]
	* @param password String
	* @return byte[]
	*/
	public static byte[] encrypt(byte[] datasource, byte[] password) { 
		byte[] byteFina = null;
        try {// 初始化加密/解密工具
            Cipher cipher = Cipher.getInstance("DES/CBC/PKCS5Padding");
            DESKeySpec desKeySpec = new DESKeySpec(password);
            SecretKeyFactory keyFactory = SecretKeyFactory.getInstance("DES");
            SecretKey secretKey = keyFactory.generateSecret(desKeySpec);
            IvParameterSpec iv = new IvParameterSpec(keys);
            cipher.init(Cipher.ENCRYPT_MODE, secretKey, iv);
            byteFina = cipher.doFinal(datasource);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return byteFina;
	}
	
	/**
	* 解密
	* @param src byte[]
	* @param password String
	* @return byte[]
	* @throws Exception
	*/
	public static byte[] decrypt(byte[] src, byte[] password) throws Exception {
		byte[] byteFina = null;
        try {// 初始化加密/解密工具
            Cipher cipher = Cipher.getInstance("DES/CBC/PKCS5Padding");
            DESKeySpec desKeySpec = new DESKeySpec(password);
            SecretKeyFactory keyFactory = SecretKeyFactory.getInstance("DES");
            SecretKey secretKey = keyFactory.generateSecret(desKeySpec);
            IvParameterSpec iv = new IvParameterSpec(keys);
            cipher.init(Cipher.DECRYPT_MODE, secretKey, iv);
            byteFina = cipher.doFinal(src);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return byteFina;
	}
}
