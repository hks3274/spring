package com.spring.sInterceptor.interceptor;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class PdsInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		System.out.println("(Pds)preHandle통과중...");
		
		HttpSession session = request.getSession();
		int level = session.getAttribute("sLevel")==null ? 99 : (int) session.getAttribute("sLevel");
		String uri = request.getRequestURI().substring(request.getRequestURI().lastIndexOf("/")+1);
		
		if(level > 3) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("/message/loginNo");
			dispatcher.forward(request, response);
			return false;
		}
		//else if(level == 3 || (level == 2 && (uri.equals("pdsInput")) || uri.equals("pdsUpdate") || uri.equals("pdsDelete"))) {
		else if(level == 3 || (level == 2 && !uri.equals("pdsList"))) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("/message/levelNo");
			dispatcher.forward(request, response);
			return false;
		}
		
		return true;
	}
	
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		System.out.println("(Pds)postHandle통과중...");
		
		super.postHandle(request, response, handler, modelAndView);
	}
	
}
