package com.spring.sample.s0613;

import org.springframework.context.support.ClassPathXmlApplicationContext;

/*
  비만도(BMI) 계산하는 프로그램을 만드시오.
  공식 : 몸무게 / (키백분율 * 키백분율)
  예) 키:170Cm, 몸무게:65Kg
     비만지수 구하는 공식 : 65 / (1.7 * 1.7)
     비만지수에 대한 판정?
     저체중: 18.5미만, 표준 : 18.5~23 , 과체중:23~25, 비만:25초과
   
   데이터의 주입은 xml을 통해서 처리한다.(입력값 : 비만지수값, 개인별 성명/키/몸무게)
 */
public class BMIRun {
	public static void main(String[] args) {
		ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext("xml/bmi.xml");
		

		BMIVO[] persons = {(BMIVO) ctx.getBean("person1"),(BMIVO) ctx.getBean("person2"),(BMIVO) ctx.getBean("person3")};
		
		BMIVO vo = new BMIVO();
		String str = vo.getService().printLine();
		for(BMIVO person : persons) {
			str += person.getService().calc(person);
			str += person.getService().printLine();
		}
		System.out.println(str);
		
		ctx.close();
	}
}
