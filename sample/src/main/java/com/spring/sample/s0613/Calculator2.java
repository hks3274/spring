package com.spring.sample.s0613;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

//@Data
@Getter
@Setter
@ToString
public class Calculator2 {
	private int su1;
	private int su2;
	
	public Calculator2(int su1, int su2) {
		this.su1 = su1;
		this.su2 = su2;
	}
	
	public void add() {
		System.out.println(su1 + " + " + su2 + " = " + (su1 + su2));
	}
	public void sub() {
		System.out.println(su1 + " - " + su2 + " = " + (su1 - su2));
	}
	public void mul() {
		System.out.println(su1 + " * " + su2 + " = " + (su1 * su2));
	}
	public void div() {
		System.out.println(su1 + " / " + su2 + " = " + (su1 / su2));
	}
}
