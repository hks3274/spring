package com.spring.sample.s0613;

public class SungjukService {

	public void getLine() {
		System.out.println("===================================================");
	}

	public void printTitle() {
		System.out.println("성명\t국어\t영어\t수학\t총점\t평균\t학점");
	}

	public SungjukVO calc(SungjukVO vo) {
		int tot = vo.getKor() + vo.getEng() + vo.getMat();
		double avg = tot / 3.0;
		String grade = "";
		if(avg >= 90) grade = "A";
		else if(avg >= 80) grade = "B";
		else if(avg >= 70) grade = "C";
		else if(avg >= 60) grade = "D";
		else grade = "F";
		
		vo.setTot(tot);
		vo.setAvg(avg);
		vo.setGrade(grade);
		
		return vo;
	}

	public void printSungjuk(SungjukVO vo) {
		System.out.println(vo.getName()+"\t"+vo.getKor()+"\t"+vo.getEng()+"\t"+vo.getMat()+"\t"+vo.getTot()+"\t"+vo.getAvg()+"\t"+vo.getGrade());
	}

}
