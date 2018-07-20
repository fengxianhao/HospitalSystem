package com.fxh.hs.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class DateUtil {
	private String day;//年月日
	private String uDay;//月日
	private String uWeek;//星期
	
	private String morning;//上午
	private String afternoon;//下午
	private String evening;//晚上
	private String mWeek;//医生出诊的星期
	
	public String getmWeek() {
		return mWeek;
	}
	public void setmWeek(String mWeek) {
		this.mWeek = mWeek;
	}
	public String getuDay() {
		return uDay;
	}
	public void setuDay(String uDay) {
		this.uDay = uDay;
	}
	public String getuWeek() {
		return uWeek;
	}
	public void setuWeek(String uWeek) {
		this.uWeek = uWeek;
	}
	public String getMorning() {
		return morning;
	}
	public void setMorning(String morning) {
		this.morning = morning;
	}
	public String getAfternoon() {
		return afternoon;
	}
	public void setAfternoon(String afternoon) {
		this.afternoon = afternoon;
	}
	public String getEvening() {
		return evening;
	}
	public void setEvening(String evening) {
		this.evening = evening;
	}
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	
	/**
     * 获取两个日期相差的天数
     *
     * @param startDateStr
     * @param endDateStr
     */
    public static int getDayBetweenTwoDate(String startDateStr, String endDateStr) {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        int days = 0;
        try {
            Date startDate= simpleDateFormat.parse(startDateStr);
            Date endDate = simpleDateFormat.parse(endDateStr);
            Calendar startCalendar = Calendar.getInstance();
            startCalendar.setTime(startDate);
            Calendar endCalendar = Calendar.getInstance();
            endCalendar.setTime(endDate);
            //计算两个日期相差的天数
            //startCalendar.getTime().getTime()返回long毫秒数形式,毫秒转为秒所以除以1000
            //1天=24小时，1小时=60分，1分=60秒，所以两个时间的差再除以60 * 60 * 24换算成天的形式
            days = ((int) (startCalendar.getTime().getTime() / 1000) - (int) (endCalendar.getTime().getTime() / 1000)) / (60 * 60 * 24);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
        return days;
    }

	public static int getDaysOfTheMonthInTheYear(int year,int month){
    	int dayCount=31;
		if(month==4||month==6||month==9||month==11){
			dayCount=30;
		}else if(month==2) {
			if(year%4==0&&year%100!=0||year%400==0){
				dayCount=29;
			}else {
				dayCount=28;
			}
		}
		return dayCount;
	}
}
