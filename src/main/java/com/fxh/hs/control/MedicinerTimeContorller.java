package com.fxh.hs.control;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fxh.hs.entity.Mediciner;
import com.fxh.hs.service.MedicinerService;
import com.fxh.hs.util.DateUtil;

import net.sf.json.JSONObject;

@Controller
public class MedicinerTimeContorller {
	@Autowired
	private MedicinerService medicinerService;
	@RequestMapping("/appointtime.service")
	private String getDateByID(Model model,@RequestParam Map<String,Object> map) throws Exception
	{
		List<DateUtil> dateUtils=new ArrayList<DateUtil>();
		
		int mid=Integer.parseInt(map.get("mid").toString());
		
		Calendar c=Calendar.getInstance();
		
		int day=c.get(Calendar.DATE);
		int month=c.get(Calendar.MONTH)+1;
		int week=c.get(Calendar.DAY_OF_WEEK);
		int year=c.get(Calendar.YEAR);
		//获取指定医生的就诊时间
		Mediciner mediciner=medicinerService.getMedicinerById(mid);
		String [] daysStrings=mediciner.getSurgeryweekday().split(",");
		int dayCount=31;
		dayCount=DateUtil.getDaysOfTheMonthInTheYear(year,month);
		//计算日期
		for (int i = 0; i < 7; i++) {
			DateUtil dateUtil=new DateUtil();
			day++;
			if(day>dayCount){
				day=1;
				month++;
			}
			if (month>12){
				month=1;
				year++;
			}
			dayCount=DateUtil.getDaysOfTheMonthInTheYear(year,month);
			dateUtil.setuDay(month+"月"+day+"日");
			
			String resultString=null;
			switch (week) {
			case 1:
				resultString="一";
				break;
			case 2:
				resultString="二";
				break;
			case 3:
				resultString="三";
				break;
			case 4:
				resultString="四";
				break;
			case 5:
				resultString="五";
				break;
			case 6:
				resultString="六";
				break;
			case 7:
				resultString="日";
				break;
			}
			dateUtil.setuWeek("星期"+resultString);
			
			week++;
			//判断星期
			if(week==8){
				week=1;
			}
			
			//判断上午和下午，晚上   2
			for (int j = 0; j < daysStrings.length; j++) {
				if (daysStrings[j].contains(resultString)) {//判断星期
					String medicinerweek=daysStrings[j].substring(3,5);
					if(medicinerweek.equals("上午")){//判断上午
						dateUtil.setMorning("y");
					}
					if(medicinerweek.equals("下午")) {
						dateUtil.setAfternoon("y");
					}
					if(medicinerweek.equals("晚上")){
						dateUtil.setEvening("y");
					}
				} 
				/*String medicinerweek=daysStrings[j].substring(3,5);
				System.out.println(medicinerweek+"--------------");
				if(medicinerweek.equals("上午")){
					//判断医生出诊的星期和当前日期是都一直
					if(daysStrings[j].contains(resultString)){
						dateUtil.setMorning("ok");
					}else {
						dateUtil.setMorning("no");
					}
				}else if (medicinerweek.equals("下午")) {
					//判断医生出诊的星期和当前日期是都一直
					if(daysStrings[j].contains(resultString)){
						dateUtil.setAfternoon("ok");
					}else {
						dateUtil.setAfternoon("no");
					}
				}else {
					//判断医生出诊的星期和当前日期是都一直
					if(daysStrings[j].contains(resultString)){
						dateUtil.setEvening("ok");
					}else {
						dateUtil.setEvening("no");
					}
				}*/
			}
			if(month<10){
				dateUtil.setDay(year+"-0"+month+"-"+day);
			}else{
				dateUtil.setDay(year+"-"+month+"-"+day);
			}
			dateUtils.add(dateUtil);
			
		}
		/*for (DateUtil dateUtil : dateUtils) {
			System.out.println(dateUtil.getuDay()+"=="+dateUtil.getuWeek()+"==="+dateUtil.getMorning()+"-"+dateUtil.getAfternoon()+"-"+dateUtil.getEvening()+"=============");
		}*/
		model.addAttribute("mediciner", mediciner);
		model.addAttribute("dayList", dateUtils);
		return "doctor_detail.jsp";
	}
	
	@RequestMapping(value = "/nextweek.service",produces="text/html;charset=UTF-8")
	private @ResponseBody String nextWeek(@RequestParam Map<String,Object> map) throws Exception{
		String theDay=map.get("day").toString();
		int mid=Integer.parseInt(map.get("mid").toString());
		List<DateUtil> dateUtils=new ArrayList<DateUtil>();
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date date = simpleDateFormat.parse(theDay);
		Calendar c=Calendar.getInstance();
		c.setTime(date);
		int day=c.get(Calendar.DATE);
		int month=c.get(Calendar.MONTH)+1;
		int week=c.get(Calendar.DAY_OF_WEEK);
		int year=c.get(Calendar.YEAR);
		//获取指定医生的就诊时间
		Mediciner mediciner=medicinerService.getMedicinerById(mid);
		String [] daysStrings=mediciner.getSurgeryweekday().split(",");
		int dayCount=31;
		dayCount=DateUtil.getDaysOfTheMonthInTheYear(year,month);
		//计算日期
		for (int i = 0; i < 7; i++) {
			DateUtil dateUtil=new DateUtil();
			day++;
			if(day>dayCount){
				day=1;
				month++;
			}
			if (month>12){
				month=1;
				year++;
			}
			dayCount=DateUtil.getDaysOfTheMonthInTheYear(year,month);
			dateUtil.setuDay(month+"月"+day+"日");
			
			String resultString=null;
			switch (week) {
			case 1:
				resultString="一";
				break;
			case 2:
				resultString="二";
				break;
			case 3:
				resultString="三";
				break;
			case 4:
				resultString="四";
				break;
			case 5:
				resultString="五";
				break;
			case 6:
				resultString="六";
				break;
			case 7:
				resultString="日";
				break;
			}
			dateUtil.setuWeek("星期"+resultString);
			
			week++;
			//判断星期
			if(week==8){
				week=1;
			}
			
			//判断上午和下午，晚上   2
			for (int j = 0; j < daysStrings.length; j++) {
				if (daysStrings[j].contains(resultString)) {//判断星期
					String medicinerweek=daysStrings[j].substring(3,5);
					if(medicinerweek.equals("上午")){//判断上午
						dateUtil.setMorning("y");
					}
					if(medicinerweek.equals("下午")) {
						dateUtil.setAfternoon("y");
					}
					if(medicinerweek.equals("晚上")){
						dateUtil.setEvening("y");
					}
				} 
			}
			if(month<10){
				dateUtil.setDay(year+"-0"+month+"-"+day);
			}else{
				dateUtil.setDay(year+"-"+month+"-"+day);
			}
			dateUtils.add(dateUtil);
				
		}
		/*for (DateUtil dateUtil : dateUtils) {
			System.out.println(dateUtil.getuDay()+"=="+dateUtil.getuWeek()+"==="+dateUtil.getMorning()+"-"+dateUtil.getAfternoon()+"-"+dateUtil.getEvening()+"=============");
		}*/
		JSONObject json = new JSONObject();
		json.put("dayList", dateUtils);
		return json.toString();
	}
	@RequestMapping(value = "/lastweek.service",produces="text/html;charset=UTF-8")
	private @ResponseBody String lastweek(@RequestParam Map<String,Object> map) throws Exception {

		String theDay = map.get("day").toString();
		int mid = Integer.parseInt(map.get("mid").toString());

		JSONObject json = new JSONObject();
		List<DateUtil> dateUtils = new ArrayList<DateUtil>();
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date date = simpleDateFormat.parse(theDay);
		Calendar c = Calendar.getInstance();
		c.setTime(date);
		int day = c.get(Calendar.DATE);
		int month = c.get(Calendar.MONTH) + 1;
		int week = c.get(Calendar.DAY_OF_WEEK)-1;
		int year = c.get(Calendar.YEAR);
		int earlierTime;
		String onTheday;
		Calendar onc = Calendar.getInstance();
		int otdd = onc.get(Calendar.DATE)+1;
		int otdm = onc.get(Calendar.MONTH) + 1;
		int otdy = onc.get(Calendar.YEAR);
		if(month<10){
			onTheday=otdy+"-0"+otdm+"-"+otdd;
		}else{
			onTheday=otdy+"-"+otdm+"-"+otdd;
		}
		earlierTime=DateUtil.getDayBetweenTwoDate(theDay,onTheday);
		json.put("earlierTime",earlierTime);
		//获取指定医生的就诊时间
		Mediciner mediciner = medicinerService.getMedicinerById(mid);
		String[] daysStrings = mediciner.getSurgeryweekday().split(",");
		int dayCount = 31;
		dayCount=DateUtil.getDaysOfTheMonthInTheYear(year,month);
		//计算日期
		for (int i = 0; i < 7; i++) {
			DateUtil dateUtil = new DateUtil();
			day--;
			if (day < 1) {
				month--;
				if (month<=0){
					month=12;
					year--;
				}
				dayCount=DateUtil.getDaysOfTheMonthInTheYear(year,month);
				day = dayCount;
			}
			dateUtil.setuDay(month + "月" + day + "日");

			String resultString = null;
			week--;
			//判断星期
			if (week == 0) {
				week = 7;
			}
			switch (week) {
				case 1:
					resultString = "一";
					break;
				case 2:
					resultString = "二";
					break;
				case 3:
					resultString = "三";
					break;
				case 4:
					resultString = "四";
					break;
				case 5:
					resultString = "五";
					break;
				case 6:
					resultString = "六";
					break;
				case 7:
					resultString = "日";
					break;
			}
			dateUtil.setuWeek("星期" + resultString);

			//判断上午和下午，晚上   2
			for (int j = 0; j < daysStrings.length; j++) {
				if (daysStrings[j].contains(resultString)) {//判断星期
					String medicinerweek = daysStrings[j].substring(3, 5);
					if (medicinerweek.equals("上午")) {//判断上午
						dateUtil.setMorning("y");
					}
					if (medicinerweek.equals("下午")) {
						dateUtil.setAfternoon("y");
					}
					if (medicinerweek.equals("晚上")) {
						dateUtil.setEvening("y");
					}
				}
			}
			if (month < 10) {
				dateUtil.setDay(year + "-0" + month + "-" + day);
			} else {
				dateUtil.setDay(year + "-" + month + "-" + day);
			}
			dateUtils.add(dateUtil);

		}
		/*for (DateUtil dateUtil : dateUtils) {
			System.out.println(dateUtil.getuDay()+"=="+dateUtil.getuWeek()+"==="+dateUtil.getMorning()+"-"+dateUtil.getAfternoon()+"-"+dateUtil.getEvening()+"=============");
		}*/

		json.put("dayList", dateUtils);
		return json.toString();
	}
}
