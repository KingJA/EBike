package com.jing.common.model;

public class Point implements java.io.Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Double longitude;
	private Double latitude;
	private String alertAddr;
	public Double getLongitude() {
		return longitude;
	}
	public void setLongitude(Double longitude) {
		this.longitude = longitude;
	}
	public Double getLatitude() {
		return latitude;
	}
	public void setLatitude(Double latitude) {
		this.latitude = latitude;
	}
	public String getAlertAddr() {
		return alertAddr;
	}
	public void setAlertAddr(String alertAddr) {
		this.alertAddr = alertAddr;
	}
	
}
