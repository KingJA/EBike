package com.jing.ebike.mapper;

import java.util.List;
import java.util.Map;

import com.jing.ebike.model.Complaint;

public interface ComplaintMapper {

	List<Complaint> queryPageMap(Map<Object, Object> map);

	Complaint getById(String id);

	void update(Complaint complaint);

	void insert(Complaint complaint);

	List<Complaint> getComplaints(Map<String, Object> map);

}
