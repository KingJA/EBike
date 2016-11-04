package com.jing.common.model;

import java.io.Serializable;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonInclude.Include;

@JsonInclude(Include.NON_NULL)
public class GeneralResponse implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 3828016235655950825L;
	private Integer code;
	private String msg;
	private Object res = null;
	public GeneralResponse(){
		
	}
	public GeneralResponse(Integer code,String msg){
		this.code = code;
		this.msg = msg;
	}
	public static GeneralResponse userNotLoginResponse(){
		return new GeneralResponse(0,"您好，请先登录后再操作，谢谢。");
	}
	public int getCode() {
		return code;
	}
	public GeneralResponse setCode(Integer code) {
		this.code = code;
		return this;
	}
	public String getMsg() {
		return msg;
	}
	public GeneralResponse setMsg(String msg) {
		this.msg = msg;
		return this;
	}
	public Object getRes() {
		return res;
	}
	public GeneralResponse setRes(Object res) {
		this.res = res;
		return this;
	}
}
