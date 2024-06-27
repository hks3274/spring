package com.spring.javaclassS.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.spring.javaclassS.vo.CalendarVO;

public interface CalendarDAO {

	public ArrayList<CalendarVO> calendarListAll();

	public int calendarInput(@Param("vo") CalendarVO vo);

	public int calendarDeleteTrue(@Param("title") String title, @Param("startTime") String startTime);

	public int calendarDelete(@Param("title") String title, @Param("startTime") String startTime, @Param("endTime") String endTime, @Param("allDay") Boolean allDay);

	public int calendarUpdate(@Param("vo") CalendarVO vo);

}
