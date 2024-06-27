package com.spring.javaclassS.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.javaclassS.dao.CalendarDAO;
import com.spring.javaclassS.vo.CalendarVO;

@Service
public class CalendarServiceImpl implements CalendarService {
	
	@Autowired
	CalendarDAO calendarDAO;

	@Override
	public ArrayList<CalendarVO> calendarListAll() {
		return calendarDAO.calendarListAll();
	}

	@Override
	public int calendarInput(CalendarVO vo) {
		return calendarDAO.calendarInput(vo);
	}

	@Override
	public int calendarDeleteTrue(String title, String startTime) {
		return calendarDAO.calendarDeleteTrue(title, startTime);
	}

	@Override
	public int calendarDelete(String title, String startTime, String endTime, Boolean allDay) {
		return calendarDAO.calendarDelete(title, startTime,endTime,allDay);
	}

	@Override
	public int calendarUpdate(CalendarVO vo) {
		return calendarDAO.calendarUpdate(vo);
	}
}
