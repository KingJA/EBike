package com.jing.ebike.service;

import java.util.List;

import org.springframework.ui.ModelMap;

import com.jing.common.page.PageView;
import com.jing.ebike.model.Complaint;

public interface ComplaintService {

	ModelMap queryComplaintMap(PageView pageView, Complaint complaint);

	Complaint getById(String id);

	void update(Complaint complaint);

	void insert(Complaint complaint);

	List<Complaint> getComplaints(int page, String userId);

}
