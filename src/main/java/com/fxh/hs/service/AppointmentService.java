package com.fxh.hs.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fxh.hs.entity.Appointment;
import com.fxh.hs.entity.AppointmentExample;
import com.fxh.hs.mapper.AppointmentMapper;
import com.fxh.hs.mapper.MedicinerMapper;

@Service
public class AppointmentService {
	@Autowired
	private AppointmentMapper appointmentMapper;
	@Autowired
	private MedicinerMapper medicinerMapper;
	//查询所有预约
	public List<Appointment> getAllAppointments(){
		return appointmentMapper.selectByExample(null);
	}
	//根据医院查询成功预约的人
	public List<Appointment> getAppointmentUser(String hname){
		AppointmentExample appointmentExample=new AppointmentExample();
		List<Integer> list=medicinerMapper.selectMid(hname);
		if(list.size()>0){
			appointmentExample.createCriteria().andMidIn(list);
		}
		return appointmentMapper.selectByExample(appointmentExample);
	}
	
	//新预约
	public int setAppointment(Map<String,Object> map){
		return appointmentMapper.setInfo(map);
	}
}
