package com.mommefatale.admin.pdf.service;
import java.util.Calendar;

public class GetCalendarServiceImple implements GetCalendarService {
	
 	public String getWeek(int year, int month, int date){
		String week= "";
		Calendar cr= Calendar.getInstance();
		cr.set(year, month-1, date);
		switch(cr.get(Calendar.DAY_OF_WEEK)){
		case Calendar.MONDAY : 
			week= "(��)";
			break;
		case Calendar.TUESDAY:
			week= "(ȭ)";
			break;
		case Calendar.WEDNESDAY:
			week= "(��)";
			break;
		case Calendar.THURSDAY:
			week= "(��)";
			break;
		case Calendar.FRIDAY:
			week= "(��)";
			break;
		case Calendar.SATURDAY:
			week= "(��)";
			break;
		case Calendar.SUNDAY:
			week= "(��)";
			break;
		}
		return week;
	}

}
