package com.jing.ebike.service;

import java.util.List;

import org.springframework.ui.ModelMap;

import com.jing.common.page.PageView;
import com.jing.ebike.model.Appointment;

public interface AppointmentService {

	ModelMap queryAppointmentMap(PageView pageView, Appointment appointment);

	Appointment getById(String id);

	void update(Appointment appointment);

	void insert(Appointment appointment);

	List<Appointment> getAppointsByUserId(String userId);

	List<Appointment> checkAppointByUser(String userId);

	void deleteById(String id);

}
