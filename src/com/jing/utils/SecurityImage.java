package com.jing.utils;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.imageio.stream.ImageOutputStream;

public class SecurityImage {
	/**
	 * 24 * 生成验证码图片 25 * @param securityCode 验证码字符 
	 * 26 * @return BufferedImage 图片
	 * 27
	 */
	public static BufferedImage createImage(String securityCode) {

		// 验证码长度
		int codeLength = securityCode.length();
		// 字体大小
		int fSize = 15;
		int fWidth = fSize + 1;
		// 图片宽度
		int width = codeLength * fWidth + 6;
		// 图片高度
		int height = fSize * 2 + 1;

		// 图片
		BufferedImage image = new BufferedImage(width, height,
				BufferedImage.TYPE_INT_RGB);
		Graphics g = image.createGraphics();

		// 设置背景色
		g.setColor(Color.WHITE);
		// 填充背景
		g.fillRect(0, 0, width, height);

		// 设置边框颜色
		g.setColor(Color.LIGHT_GRAY);
		// 边框字体样式
		g.setFont(new Font("Arial", Font.BOLD, height - 2));
		// 绘制边框
		g.drawRect(0, 0, width - 1, height - 1);

		// 绘制噪点
		Random rand = new Random();
		// 设置噪点颜色
		g.setColor(Color.LIGHT_GRAY);
		for (int i = 0; i < codeLength * 6; i++) {
			int x = rand.nextInt(width);
			int y = rand.nextInt(height);
			// 绘制1*1大小的矩形
			g.drawRect(x, y, 1, 1);
		}

		// 绘制验证码
		int codeY = height - 10;
		// 设置字体颜色和样式
		g.setColor(new Color(19, 148, 246));
		g.setFont(new Font("Georgia", Font.BOLD, fSize));
		for (int i = 0; i < codeLength; i++) {
			g.drawString(String.valueOf(securityCode.charAt(i)), i * 16 + 5,
					codeY);
		}
		// 关闭资源
		g.dispose();

		return image;
	}

	/**
	 * 83 * 返回验证码图片的流格式 84 * @param securityCode 验证码 85 * @return
	 * ByteArrayInputStream 图片流 86
	 */
	public static ByteArrayInputStream getImageAsInputStream(String securityCode) {

		BufferedImage image = createImage(securityCode);
		return convertImageToStream(image);
	}

	/**
	 * 94 * 将BufferedImage转换成ByteArrayInputStream 95 * @param image 图片 96 * @return
	 * ByteArrayInputStream 流 97
	 */
	private static ByteArrayInputStream convertImageToStream(BufferedImage image) {
		
		ByteArrayOutputStream output = new ByteArrayOutputStream();  
        ImageOutputStream imageOut;
		try {
			imageOut = ImageIO.createImageOutputStream(output);
			ImageIO.write(image, "PNG", imageOut);  
		    imageOut.close();  
		    ByteArrayInputStream input = new ByteArrayInputStream(output.toByteArray());  
		    return input;
		} catch (Exception e1) {
			e1.printStackTrace();
		}  
		return null;
	}
	
	
//	JSP
//	<img src="security/securityCodeImageAction" id="Verify"  style="cursor:hand;" alt="看不清，换一张"/>
	
	
//	<input type="text" name="securityCode"/>

//	jq
//	 $(function () {  
//	    //点击图片更换验证码
//	        $("#Verify").click(function(){
//	    	$(this).attr("src","SecurityCodeImageAction?timestamp="+new Date().getTime());
//		      });
//		 });
	
//	js
//	window.onload=function(){
//		     var verifyObj = document.getElementById("Verify");
//		     verifyObj.onclick=function(){
//		        this.src="SecurityCodeImageAction?timestamp="+new Date().getTime();
//		    };
//		 }
}
