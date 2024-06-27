package com.spring.javaclassS.service;

import java.util.ArrayList;

import com.spring.javaclassS.vo.CalendarVO;

public interface CalendarService {

	public ArrayList<CalendarVO> calendarListAll();

	public int calendarInput(CalendarVO vo);

	public int calendarDeleteTrue(String title, String startTime);

	public int calendarDelete(String title, String startTime, String endTime, Boolean allDay);

	public int calendarUpdate(CalendarVO vo);

}
