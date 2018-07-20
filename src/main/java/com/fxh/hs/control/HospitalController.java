package com.fxh.hs.control;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fxh.hs.entity.Dept;
import com.fxh.hs.entity.Hospital;
import com.fxh.hs.entity.Mediciner;
import com.fxh.hs.service.AppointmentService;
import com.fxh.hs.service.DeptService;
import com.fxh.hs.service.HospitalService;
import com.fxh.hs.service.MedicinerService;

@Controller
public class HospitalController {
	@Autowired
	private HospitalService hospitalService;
	@Autowired
	private DeptService deptService;
	@Autowired
	private MedicinerService medicinerService;
	@Autowired
	private AppointmentService appointmentService;
	//首页信息加载
	@RequestMapping("/homeLoading.service")
	public String homeLoading(Model model){
		//医院推荐
		List<Hospital> list=hospitalService.getAllHospital();
		List<Hospital> hospitals=new ArrayList<Hospital>();
		for (Hospital hospital : list) {
			int acount=appointmentService.getAppointmentUser(hospital.getHname()).size();
			int mcount=medicinerService.getMedicinersByHospital(hospital.getHname()).size();
			hospital.setMcount(mcount);
			hospital.setAcount(acount);
			hospitals.add(hospital);
		}
		model.addAttribute("hospitals", hospitals);
		//右侧数据统计
		int count=hospitalService.getAllHospital().size();
		int count1=medicinerService.getAllMediciners().size();
		int count2=appointmentService.getAllAppointments().size();
		model.addAttribute("count", count);
		model.addAttribute("count1", count1);
		model.addAttribute("count2", count2);
		//热门科室
		List<Dept> deptList=deptService.getDeptPramer();
		List<Dept> pDepts=new ArrayList<Dept>();
		for (Dept dept : deptList) {
			List<Dept> depts=deptService.getDepts(dept.getDid());
			dept.setDepts(depts);
			pDepts.add(dept);
		}
		model.addAttribute("pDepts", pDepts);
		//名师名医
		List<Mediciner> mediciners=medicinerService.getAllMediciners();
		model.addAttribute("mediciners", mediciners);
		return "index.jsp";
	}

	
	//根据医院名称查询医院
	@RequestMapping("/getHosByName.service")
	public String getHospitaltByName(String hname,Model model){
		List<Hospital> list=hospitalService.getHospitalByName(hname);
		List<Hospital> hospitals=new ArrayList<Hospital>();
		for (Hospital hospital : list) {
			int acount=appointmentService.getAppointmentUser(hospital.getHname()).size();
			int mcount=medicinerService.getMedicinersByHospital(hospital.getHname()).size();
			hospital.setMcount(mcount);
			hospital.setAcount(acount);
			hospitals.add(hospital);
		}
		model.addAttribute("hname", hname);
		model.addAttribute("hospitals", hospitals);
		int count=hospitals.size();
		model.addAttribute("count", count);
		return "hospital_list.jsp";
	}
	
	
	//根据医院等级查询医院
	@RequestMapping("/getHosByGrade.service")
	public String getHospitaltByGrade(String grade,Model model){
		String gradeStr="";
		if (null!=grade){
			try {
				gradeStr=new String(grade.getBytes("ISO-8859-1"),"UTF-8");
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		List<Hospital> list=hospitalService.getHospitalByGrade(gradeStr);
		List<Hospital> hospitals=new ArrayList<Hospital>();
		for (Hospital hospital : list) {
			int acount=appointmentService.getAppointmentUser(hospital.getHname()).size();
			int mcount=medicinerService.getMedicinersByHospital(hospital.getHname()).size();
			hospital.setMcount(mcount);
			hospital.setAcount(acount);
			hospitals.add(hospital);
		}
		model.addAttribute("hname", gradeStr);
		model.addAttribute("hospitals", hospitals);
		int count=hospitals.size();
		model.addAttribute("count", count);
		return "hospital_list.jsp";
	}
	
	
	//医院详细信息加载
		@RequestMapping("/getMedicinerByHospital.service")
		public String getMedicinerByHospital(String hname, Model model){
			String hnameStr="";
			if (null!=hname){
				try {
					hnameStr=new String(hname.getBytes("ISO-8859-1"),"UTF-8");
				} catch (UnsupportedEncodingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			Hospital hospital=hospitalService.getHospitalByName(hnameStr).get(0);
			List<Mediciner> mediciners=medicinerService.getMedicinersByHospital(hospital.getHname());
			//查出所有一级科室
			List<Dept> depts=deptService.getDeptPramer();
			model.addAttribute("depts", depts);
			int count=mediciners.size();
			model.addAttribute("hospital", hospital);
			model.addAttribute("count", count);
			model.addAttribute("mediciners", mediciners);
			return "hospital_detail.jsp";
		}
	
}
