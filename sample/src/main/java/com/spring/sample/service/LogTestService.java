package com.spring.sample.service;

import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;

@Slf4j
//@Component
@Service
public class LogTestService {

	public void getLogTest1() {
		System.out.println();
		log.info("이곳은 LogTestService객체의 getLogTest1()메소드 입니다.");
		System.out.println();
	}
}
