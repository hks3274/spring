package com.atom.study.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class StudyController implements Controller {

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("여기는 studyController 입니다.");
		
		/*
		 * ModelAndView mv = new ModelAndView();
		 * 
		 * mv.addObject("data", "안녕하세요"); 
		 * mv.setViewName("/WEB-INF/views/index.jsp");
		 */
		
//		 ModelAndView mv = new ModelAndView("/WEB-INF/views/index.jsp");
		//이작업을 해주는 클래스 -> vue resolve
		 ModelAndView mv = new ModelAndView("index");
		 mv.addObject("data", "안녕하세요"); 
		 
		 //mv.setViewName("/WEB-INF/views/index.jsp");
		
		return mv;
	}
	
}
