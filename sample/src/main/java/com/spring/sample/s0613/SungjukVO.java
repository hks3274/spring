package com.spring.sample.s0613;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class SungjukVO {
	private String name;
	private int kor;
	private int eng;
	private int mat;
	
	private int tot;
	private double avg;
	private String grade;
}
