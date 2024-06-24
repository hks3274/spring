package com.spring.sample.s0613;

import java.util.ArrayList;

import org.springframework.context.support.ClassPathXmlApplicationContext;

public class SungjukRun2 {
	public static void main(String[] args) {
		ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext("xml/sungjuk.xml");
		
		ArrayList<SungjukVO> vos = new ArrayList<SungjukVO>();
		SungjukVO vo = null;
		
		vo = (SungjukVO) ctx.getBean("vo1");
		vos.add(vo);
		
		vo = (SungjukVO) ctx.getBean("vo2");
		vos.add(vo);
		
		vo = (SungjukVO) ctx.getBean("vo3");
		vos.add(vo);
		
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
