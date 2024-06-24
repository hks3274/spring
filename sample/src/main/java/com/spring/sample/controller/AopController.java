package com.spring.sample.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.sample.service.AopService;
import com.spring.sample.service.LogTestService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/aop")
public class AopController {
	
	@Autowired
	LogTestService logTestService;
	
	@Autowired
	private AopService aopService;
	
	@RequestMapping(value = "/aopMenu", method = RequestMethod.GET)
	public String getAopMenu() {
		log.info("이곳은 AopController객체의 getAopMenu메소드 입니다.\n");
		return "aop/aopMenu";
	}
	
	@RequestMapping(value = "/aopTest1", method = RequestMethod.GET)
	public String getAopTest1() {
		log.info("getAopTest1메소드 입니다.\n");
		
		aopService.getAopServiceTest1();
		
		return "aop/aopMenu";
	}
	
	@RequestMapping(value = "/aopTest2", method = RequestMethod.GET)
	public String getAopTest2() {
		log.info("getAopTest2메소드 입니다.\n");
		
		aopService.getAopServiceTest2();
		
		return "aop/aopMenu";
	}
	
	@RequestMapping(value = "/aopTest3", method = RequestMethod.GET)
	public String getAopTest3() {
		log.info("getAopTest3메소드 입니다.\n");
		
		aopService.getAopServiceTest3();
		
		return "aop/aopMenu";
	}
	
	@RequestMapping(value = "/aopTest4", method = RequestMethod.GET)
	public String getAopTest4() {
		log.info("getAopTest4메소드 입니다.\n");
		
		aopService.getAopServiceTest4();
		
		return "aop/aopMenu";
	}
	
	@RequestMapping(value = "/aopTest5", method = RequestMethod.GET)
	public String getAopTest5() {
		log.info("getAopTest5메소드 입니다.\n");
		
		aopService.getAopServiceT_5();
		
		return "aop/aopMenu";
	}
	
}
