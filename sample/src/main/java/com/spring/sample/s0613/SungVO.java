package com.spring.sample.s0613;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class SungVO {
	private String name;
	private int kor;
	private int eng;
	private int mat;
	
	private int tot;
	private double avg;
	private String grade;
	
	private SungService service = new SungService();
	
	public void sungCalc() {
		SungVO vo = service.calc(name, kor, eng, mat);
		this.tot = vo.getTot();
		this.avg = vo.getAvg();
		this.grade = vo.getGrade();
	}
	
	public void SungPrint() {
		service.printSungjuk(name, kor, eng, mat, tot, avg, grade);
	}
	
}
