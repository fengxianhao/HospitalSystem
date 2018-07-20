package com.fxh.hs.control;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fxh.hs.entity.Mediciner;
import com.fxh.hs.service.AppointmentService;
import com.fxh.hs.service.MedicinerService;

import net.sf.json.JSONObject;



@Controller
public class AppointmentController {
	@Autowired
	private AppointmentService appointmentService;
	@Autowired
	private MedicinerService medicinerService;
	
	//请求预约
	@RequestMapping("/setA.service")
	public String setA(@RequestParam Map<String,Object> map,Model model){
		Mediciner mediciner = medicinerService.getMedicinerById(Integer.parseInt(""+map.get("_mid")));
		String visittime=null;
		try {
			visittime=new String(map.get("_visittime").toString().getBytes("ISO-8859-1"),"UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		map.put("_visittime", visittime);
		model.addAttribute("map",map);
		model.addAttribute("mediciner",mediciner);
		return "appointment_form.jsp";
	}
	//响应预约
	@RequestMapping(value = "/setAppointment.service",produces="text/html;charset=UTF-8")
	public @ResponseBody String setAppointment(@RequestParam Map<String,Object> map) throws Exception{
		Map<String,Object> appointment =new HashMap<String, Object>();
		appointment.put("_u_id", map.get("u_id"));
		appointment.put("_p_name",map.get("p_name") );
		appointment.put("_m_id",map.get("m_id") );
		String visitTime = map.get("visit_time").toString();
		appointment.put("_visit_time", visitTime);
		appointmentService.setAppointment(appointment);
		int flag = Integer.parseInt(appointment.get("flag").toString());
		JSONObject json = new JSONObject();
		json.put("flag", flag);
		json.put("visitTime", visitTime);
		return json.toString();
	}
}
