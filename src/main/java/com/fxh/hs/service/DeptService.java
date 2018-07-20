package com.fxh.hs.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fxh.hs.entity.Dept;
import com.fxh.hs.entity.DeptExample;
import com.fxh.hs.mapper.DeptMapper;

@Service
public class DeptService {
	@Autowired
	private DeptMapper deptMapper;
	//查询一级科室
	public List<Dept> getDeptPramer(){
		DeptExample example=new DeptExample();
		example.createCriteria().andPdidIsNull();
		return deptMapper.selectByExample(example);
	}
	//根据ID查询二级科室
	public List<Dept> getDepts(int did){
		DeptExample example=new DeptExample();
		example.createCriteria().andPdidEqualTo(did);
		return deptMapper.selectByExample(example);
	}
	//根据科室名查询
	public List<Dept> getDeptByDname(String dname){
		DeptExample example=new DeptExample();
		example.createCriteria().andDnameEqualTo(dname);
		return deptMapper.selectByExample(example);
	}
}
