package com.spring.sample.s0613;

import org.springframework.context.support.ClassPathXmlApplicationContext;

public class BMIService {
	public String calc(BMIVO vo) {
		ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext("xml/bmi.xml");
		BMIVO bVo = (BMIVO) ctx.getBean("bmi");
		
		double dblHeight = vo.getHeight() / 100.0;
		double bmi = vo.getWeight() / (dblHeight * dblHeight);
		
		String str = "\n성명 : "+vo.getName()+" , 키 : "+vo.getHeight()+"cm , 몸무게 : "+vo.getWeight()+"kg\n";
		str += vo.getName() + "님의 비만지수는 "+String.format("%.2f", bmi)+"로 ";
		if(bmi < bVo.getLow()) str += "저체중 입니다. 음식을 가리지 말고 많이 많이 드세요";
		else if(bmi <= bVo.getNormal()) str += "정상 입니다. 꾸준히 건강관리 잘 하세요.";
		else if(bmi <= bVo.getHigh()) str += "과체중 입니다. 지금부터라도 체중관리 잘 하세요.";
		else str += "비만 입니다. 음식보기를 돌같이 하라~~ 꾸준히 노력하세요.";
		str += "\n";
	  // System.out.println("\n" + vo.getName() + "님의 비만지수는 "+String.format("%.2f", bmi)+"입니다.\n"+ vo.getName() + str + "\n");
	  //str = "\n" + vo.getName() + "님의 비만지수는 "+String.format("%.2f", bmi)+"입니다.\n"+ vo.getName() + str + "\n";
	  
	  ctx.close();
	  
	  return str;
	}

	public String printLine() {
		return "====================================================================";
	}
}
