package com.jing.ebike.model;

import java.util.Date;

import com.jing.common.model.Dictionary;
import com.jing.utils.DateUtil;

public class Appointment  implements java.io.Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String id;
	private String userId;
	private Date appointTime;
	private Integer place;
	private Date applyTime;
	private Integer status;
	private String message;
	
	private String appointTimeStr;
	private String applyTimeStr;
	private String statusText;//字典2
	private String placeText;
	private String userName;
	private String realName;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public Date getAppointTime() {
		if(appointTime==null) return DateUtil.getFormatDate(appointTimeStr);
		return appointTime;
	}
	public void setAppointTime(Date appointTime) {
		this.appointTime = appointTime;
	}
	public Integer getPlace() {
		return place;
	}
	public void setPlace(Integer place) {
		this.place = place;
	}
	public Date getApplyTime() {
		return applyTime;
	}
	public void setApplyTime(Date applyTime) {
		this.applyTime = applyTime;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public String getAppointTimeStr() {
		if(appointTimeStr==null) return DateUtil.getDate(appointTime);
		return appointTimeStr;
	}
	public String getApplyTimeStr() {
		return DateUtil.getDateTime(applyTime);
	}
	public String getStatusText() {
		return Dictionary.getInstance().getDictMc("3", status.toString());
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getRealName() {
		return realName;
	}
	public void setRealName(String realName) {
		this.realName = realName;
	}
	public String getPlaceText() {
		return Dictionary.getInstance().getDictMc("4", place.toString());
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public void setAppointTimeStr(String appointTimeStr) {
		this.appointTimeStr = appointTimeStr;
	}
	public void setApplyTimeStr(String applyTimeStr) {
		this.applyTimeStr = applyTimeStr;
	}
	
}
