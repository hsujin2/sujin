package com.mommefatale.admin.pdf.service;
import java.util.Calendar;

public class GetCalendarServiceImple implements GetCalendarService {
	
 	public String getWeek(int year, int month, int date){
		String week= "";
		Calendar cr= Calendar.getInstance();
		cr.set(year, month-1, date);
		switch(cr.get(Calendar.DAY_OF_WEEK)){
		case Calendar.MONDAY : 
			week= "(월)";
			break;
		case Calendar.TUESDAY:
			week= "(화)";
			break;
		case Calendar.WEDNESDAY:
			week= "(수)";
			break;
		case Calendar.THURSDAY:
			week= "(목)";
			break;
		case Calendar.FRIDAY:
			week= "(금)";
			break;
		case Calendar.SATURDAY:
			week= "(토)";
			break;
		case Calendar.SUNDAY:
			week= "(일)";
			break;
		}
		return week;
	}

}
