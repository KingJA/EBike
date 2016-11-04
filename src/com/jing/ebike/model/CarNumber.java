package com.jing.ebike.model;

import java.util.Date;

import com.jing.utils.DateUtil;

public class CarNumber implements java.io.Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String id;
	private String carNum;
	private String userId="";
	private Date createTime;
	private Date useTime;
	private Integer defenceStatus=0;
	
	private String createTimeStr;
	private String useTimeStr;
	private String userName;
	private String realName;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCarNum() {
		return carNum;
	}
	public void setCarNum(String carNum) {
		this.carNum = carNum;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public Date getUseTime() {
		return useTime;
	}
	public void setUseTime(Date useTime) {
		this.useTime = useTime;
	}
	public String getCreateTimeStr() {
		return DateUtil.getDateTime(createTime);
	}
	public void setCreateTimeStr(String createTimeStr) {
		this.createTimeStr = createTimeStr;
	}
	public String getUseTimeStr() {
		return DateUtil.getDateTime(useTime);
	}
	public void setUseTimeStr(String useTimeStr) {
		this.useTimeStr = useTimeStr;
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
	public Integer getDefenceStatus() {
		return defenceStatus;
	}
	public void setDefenceStatus(Integer defenceStatus) {
		this.defenceStatus = defenceStatus;
	}
	@Override
	public String toString() {
		return "CarNumber [id=" + id + ", carNum=" + carNum + ", userId="
				+ userId + "]";
	}
	
}
