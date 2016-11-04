package com.jing.ebike.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.jing.ebike.mapper.PositionLogMapper;
import com.jing.ebike.service.PositionLogService;
@Service(value="positionLogService")
public class PositionLogServiceImpl implements PositionLogService {

	@Resource
	private PositionLogMapper positionLogMapper;
	
}
