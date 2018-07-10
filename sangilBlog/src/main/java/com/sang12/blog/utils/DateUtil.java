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
}
