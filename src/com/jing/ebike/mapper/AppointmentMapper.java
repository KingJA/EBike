package com.jing.ebike.mapper;

import java.util.List;
import java.util.Map;

import com.jing.ebike.model.Appointment;

public interface AppointmentMapper {

	void update(Appointment appointment);

	Appointment getById(String id);

	List<Appointment> queryPageMap(Map<Object, Object> map);

	void insert(Appointment appointment);

	List<Appointment> getAppointsByUserId(String userId);

	List<Appointment> checkAppointByUser(String userId);

	void deleteById(String id);

}
