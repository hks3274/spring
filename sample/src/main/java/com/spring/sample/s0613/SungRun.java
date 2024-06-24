package com.spring.sample.s0613;

import java.util.Scanner;

public class SungRun {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		
		SungVO vo = new SungVO();
		
		System.out.print("성명을 입력하세요? ");
		vo.setName(sc.next());
		
		System.out.print("국어점수를 입력하세요? ");
		vo.setKor(sc.nextInt());
		
		System.out.print("영어점수를 입력하세요? ");
		vo.setEng(sc.nextInt());
		
		System.out.print("수학점수를 입력하세요? ");
		vo.setMat(sc.nextInt());
		
		
		vo.sungCalc();
		vo.SungPrint();
		
		
		sc.close();
	}
}
