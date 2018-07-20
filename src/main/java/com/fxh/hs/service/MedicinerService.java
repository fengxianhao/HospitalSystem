package com.fxh.hs.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fxh.hs.entity.Dept;
import com.fxh.hs.entity.Mediciner;
import com.fxh.hs.entity.MedicinerExample;
import com.fxh.hs.mapper.DeptMapper;
import com.fxh.hs.mapper.MedicinerMapper;

@Service
public class MedicinerService {
	@Autowired
	private MedicinerMapper medicinerMapper;
	@Autowired
	private DeptMapper deptMapper;
	@Autowired
	private DeptService deptService;
	
	//查询所有医生
	public List<Mediciner> getAllMediciners(){
		return medicinerMapper.selectByExample(null);
	}
	
	//根据科室查询医生
	public List<Mediciner> getMedicinersByDept(String dname){
		MedicinerExample example=new MedicinerExample();
		Dept dept=deptService.getDeptByDname(dname).get(0);
		if(null!=dept.getPdid()){
			example.createCriteria().andDeptEqualTo(dname);
		}else{
			List<Dept> depts=deptService.getDepts(dept.getDid());
			List<String> list=new ArrayList<String>();
			for (Dept dept2 : depts) {
				list.add(dept2.getDname());
			}
			example.createCriteria().andDeptIn(list);
		}
		return medicinerMapper.selectByExample(example);
	}
	
	//在某医院中根据一级科室查询医生
	public List<Mediciner> getMedicinersByDept(String dname, String hname){
		MedicinerExample example=new MedicinerExample();
		Dept dept=deptService.getDeptByDname(dname).get(0);
		List<Dept> depts=deptService.getDepts(dept.getDid());
		List<String> list=new ArrayList<String>();
		for (Dept dept2 : depts) {
			list.add(dept2.getDname());
		}
		example.createCriteria().andDeptIn(list).andHospitalEqualTo(hname);
		return medicinerMapper.selectByExample(example);
	}
	
	//根据职称查询医生
	public List<Mediciner> getMedicinersByTitle(String title){
		MedicinerExample example=new MedicinerExample();
		example.createCriteria().andTitleEqualTo(title);
		return medicinerMapper.selectByExample(example);
	}
	
	//在某医院中根据职称查询医生
	public List<Mediciner> getMedicinersByTitle(String title, String hname){
		MedicinerExample example=new MedicinerExample();
		example.createCriteria().andTitleEqualTo(title).andHospitalEqualTo(hname);
		return medicinerMapper.selectByExample(example);
	}
	//根据所属医院查询医生
	public List<Mediciner> getMedicinersByHospital(String hospital){
		MedicinerExample example=new MedicinerExample();
		example.createCriteria().andHospitalEqualTo(hospital);
		return medicinerMapper.selectByExample(example);
	}
	//模糊查询医生
	public List<Mediciner> getMediciners(String requirement){
		String what="%"+requirement+"%";
		return medicinerMapper.selectMedicinerByWhat(what);
	}
	//查询指定医生的就诊时间
	public Mediciner getMedicinerById(int id){
		return medicinerMapper.selectByPrimaryKey(id);
	}
}
