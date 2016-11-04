package com.jing.common.model;

public class DictCategory implements java.io.Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private String dictName;
	private Integer isConfig;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getDictName() {
		return dictName;
	}
	public void setDictName(String dictName) {
		this.dictName = dictName;
	}
	public Integer getIsConfig() {
		return isConfig;
	}
	public void setIsConfig(Integer isConfig) {
		this.isConfig = isConfig;
	}
	
}
