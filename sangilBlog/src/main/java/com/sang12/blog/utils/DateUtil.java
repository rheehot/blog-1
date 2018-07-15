package com.sang12.blog.utils;

import java.text.SimpleDateFormat;
import java.util.Calendar;

public class DateUtil {
	public static String addDayGetString(int day){
		Calendar calendar = Calendar.getInstance();
		calendar.add(Calendar.DATE, day);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		return sdf.format(calendar.getTime());
	}
	
	/**
	 * 현재달의 첫번째 일을 구한다.
	 * @return
	 */
	public static String getFirstDayOfMonth() {
		Calendar calendar = Calendar.getInstance();  
		calendar.set(Calendar.DAY_OF_MONTH, 1);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
	    return sdf.format(calendar.getTime());
	}
	
	/**
	 * 현재월의 마지막 일을 구한다.
	 * @return
	 */
	public static String getLastDayOfMonth() {
		Calendar calendar = Calendar.getInstance();  
		calendar.add(Calendar.MONTH, 1);  
        calendar.set(Calendar.DAY_OF_MONTH, 1);  
        calendar.add(Calendar.DATE, -1);  
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
	    return sdf.format(calendar.getTime());
	}
}
