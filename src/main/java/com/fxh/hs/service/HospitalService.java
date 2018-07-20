package com.fxh.hs.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fxh.hs.entity.Hospital;
import com.fxh.hs.entity.HospitalExample;
import com.fxh.hs.mapper.HospitalMapper;

@Service
public class HospitalService {
	@Autowired
	private HospitalMapper hospitalMapper;
	
	//查询所有医院
	public List<Hospital> getAllHospital(){
		return hospitalMapper.selectByExample(null);
	}
	//根据医院名称查询医院
	public List<Hospital> getHospitalByName(String hname){
		HospitalExample example=new HospitalExample();
		example.createCriteria().andHnameLike(hname);
		return hospitalMapper.selectByExample(example);
	}
	//根据医院等级查询医院
	public List<Hospital> getHospitalByGrade(String grade){
		HospitalExample example=new HospitalExample();
		example.createCriteria().andGradeLike(grade);
		return hospitalMapper.selectByExample(example);
	}
}
