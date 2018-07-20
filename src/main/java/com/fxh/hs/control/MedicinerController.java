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
import com.fxh.hs.service.DeptService;
import com.fxh.hs.service.HospitalService;
import com.fxh.hs.service.MedicinerService;

@Controller
public class MedicinerController {
	@Autowired
	private MedicinerService medicinerService;
	@Autowired
	private HospitalService hospitalService;
	@Autowired
	private DeptService deptService;
	

	//根据一级科室查询医生
	@RequestMapping("/getMedicinersByDept.service")
	 public String getMedicinersByDept(String hname,String dname, Model model){
		//查出所有一级科室
				List<Dept> depts=deptService.getDeptPramer();
				model.addAttribute("depts", depts);
		String hnameStr="";
		String dnameStr="";
		if (null!=dname) {
			try {
				dnameStr=new String(dname.getBytes("ISO-8859-1"),"UTF-8");
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			if(null==hname){
				List<Mediciner> mediciners=medicinerService.getMedicinersByDept(dnameStr);
				model.addAttribute("mediciners", mediciners);
				int count=mediciners.size();
				model.addAttribute("count", count);
				return "doctor_list.jsp";
			}else{
				try {
					hnameStr=new String(hname.getBytes("ISO-8859-1"),"UTF-8");
				} catch (UnsupportedEncodingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				Hospital hospital=hospitalService.getHospitalByName(hnameStr).get(0);
				List<Mediciner> mediciners=medicinerService.getMedicinersByDept(dnameStr, hospital.getHname());
				int count=mediciners.size();
				model.addAttribute("hospital", hospital);
				model.addAttribute("count", count);
				model.addAttribute("mediciners", mediciners);
				return "hospital_detail.jsp";
			}
		}else{
			if(null==hname){
				List<Mediciner> mediciners=medicinerService.getAllMediciners();
				model.addAttribute("mediciners", mediciners);
				int count=mediciners.size();
				model.addAttribute("count", count);
				return "doctor_list.jsp";
			}else{
				return "getMedicinerByHospital.service?hname"+hname;
			}
		}
		
	}
	
	
	//根据职称查询医生
	@RequestMapping("/getMedicinersByTitle.service")
	public String getMedicinersByTitle(String hname,String title, Model model){
		//查出所有一级科室
				List<Dept> depts=deptService.getDeptPramer();
				model.addAttribute("depts", depts);
		String hnameStr="";
		String titleStr="";
		if (null!=title) {
			try {
				titleStr=new String(title.getBytes("ISO-8859-1"),"UTF-8");
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			if(null==hname){
				List<Mediciner> mediciners=medicinerService.getMedicinersByTitle(titleStr);
				model.addAttribute("mediciners", mediciners);
				int count=mediciners.size();
				model.addAttribute("count", count);
				return "doctor_list.jsp";
			}else{
				try {
					hnameStr=new String(hname.getBytes("ISO-8859-1"),"UTF-8");
				} catch (UnsupportedEncodingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				Hospital hospital=hospitalService.getHospitalByName(hnameStr).get(0);
				List<Mediciner> mediciners=medicinerService.getMedicinersByTitle(titleStr, hospital.getHname());
				int count=mediciners.size();
				model.addAttribute("hospital", hospital);
				model.addAttribute("count", count);
				model.addAttribute("mediciners", mediciners);
				return "hospital_detail.jsp";
			}
		}else{
			if(null==hname){
				List<Mediciner> mediciners=medicinerService.getAllMediciners();
				model.addAttribute("mediciners", mediciners);
				int count=mediciners.size();
				model.addAttribute("count", count);
				return "doctor_list.jsp";
			}else{
				return "getMedicinerByHospital.service?hname"+hname;
			}
		}
	}
	
	
	
	//模糊查询医生
	@RequestMapping("/getMedicinersByWhat.service")
	public String getMedicinersByWhat(String requirement, Model model){
		//查出所有一级科室
		List<Dept> depts=deptService.getDeptPramer();
		model.addAttribute("depts", depts);
		List<Mediciner> mediciners=new  ArrayList<Mediciner>();
		if(null!=requirement){
			String requirementStr="";
			try {
				requirementStr=new String(requirement.getBytes("ISO-8859-1"),"UTF-8");
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			mediciners=medicinerService.getMediciners(requirementStr);
		}else{
			mediciners=medicinerService.getAllMediciners();
			
		}
		model.addAttribute("mediciners", mediciners);
		int count=mediciners.size();
		model.addAttribute("count", count);
		return "doctor_list.jsp";
	}
	
	
	//医生详细信息加载
	
	public String getDoctorDetail(){
		return "doctor_detail.jsp";
	}
	
}
