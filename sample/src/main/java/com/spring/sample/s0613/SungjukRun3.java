package com.spring.sample.s0613;

import org.springframework.context.support.ClassPathXmlApplicationContext;

public class SungjukRun3 {
	public static void main(String[] args) {
		ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext("xml/sungjuk.xml");
		
		SungjukVO[] vos = {(SungjukVO) ctx.getBean("vo1"),(SungjukVO) ctx.getBean("vo2"),(SungjukVO) ctx.getBean("vo3")};
		
		SungjukService service = new SungjukService();
		
		service.getLine();
		service.printTitle();
		service.getLine();
		
		for(SungjukVO v : vos) {
			SungjukVO sVo = service.calc(v);
			service.printSungjuk(sVo);
		}
		service.getLine();
		
		ctx.close();
	}
}
