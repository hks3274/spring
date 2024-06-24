package com.atom.study.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class AtomController implements Controller {
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("이곳은 Atom controller 입니다");
	
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("data", "아톰에서 갑니다.");
//		mv.setViewName("/WEB-INF/views/atom.jsp");
		mv.setViewName("atom");
		
		return mv;
	}
}
