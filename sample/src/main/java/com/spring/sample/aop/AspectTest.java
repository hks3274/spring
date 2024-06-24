package com.spring.sample.aop;

import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.stereotype.Component;

@EnableAspectJAutoProxy
@Component
@Aspect
public class AspectTest {
	/*
	// Advice
	@Around("execution(* com.spring.sample.service.AopService.getAopServiceTest1(..))")		// PointCut설정(사용범위 설정 : ("execution(타입 패키지명.클래스명.메소드명(매개변수))"))
	public void aroundAdvice(ProceedingJoinPoint joinPoint) throws Throwable {
		
		System.out.println("\n이곳은 aroundAdvice메소드(전) 입니다. : " + joinPoint);
		
		joinPoint.proceed();
		
		System.out.println("\n이곳은 aroundAdvice메소드(후) 입니다. : " + joinPoint);
	}
	
	@Before("execution(* com.spring.sample.service.AopService.getAopServiceTest1(..))")		// PointCut설정(사용범위 설정 : ("execution(타입 패키지명.클래스명.메소드명(매개변수))"))
	public void beforeAdvice(JoinPoint joinPoint) throws Throwable {
		System.out.println("\n이곳은 beforeAdvice메소드 입니다.");
	}
	
	@AfterReturning("execution(* com.spring.sample.service.AopService.getAopServiceTest1(..))")		// PointCut설정(사용범위 설정 : ("execution(타입 패키지명.클래스명.메소드명(매개변수))"))
	public void afterReturningAdvice(JoinPoint joinPoint) throws Throwable {
		System.out.println("\n이곳은 afterReturningAdvice메소드 입니다.");
	}
	*/
	
	/*
	@Pointcut("execution(* com.spring.sample.service.AopService.getAopServiceTest1(..))")
	private void cut() {}
	
	@Before("cut()")
	public void beforeAdvice(JoinPoint joinPoint) throws Throwable {
		System.out.println("\n이곳은 beforeAdvice메소드 입니다. : " + joinPoint);
	}
	
	@AfterReturning("cut()")
	public void afterReturningAdvice(JoinPoint joinPoint) throws Throwable {
		System.out.println("\n이곳은 afterReturningAdvice메소드 입니다.");
	}
	*/
	
	/*
	@Around("execution(* com.spring.sample.service.AopService.getAopServiceTest*(..))")
	public void aroundAdvice( ) {
		System.out.println("\n이곳은 aroundAdvice메소드 입니다.");
	}
	*/
	
	@Pointcut("execution(* com.spring.sample.service.AopService.getAopServiceTest2(..))")
	private void cut() {}
	
	@AfterReturning(value="cut()", returning="obj")
	public void aroundAdvice(Object obj) {
		System.out.println("\n이곳은 AfterReturningAdvice메소드 입니다. : obj = " + obj);
	}
	
	/*
	//@Around("execution(* com.spring.sample.service..*.*(..))")
	@Around("execution(* com.spring.sample.service.AopService.getAopServiceTest*(..))")
	public Object aroundAdvice(ProceedingJoinPoint joinPoint) throws Throwable {
		System.out.println("\n이곳은 aroundAdvice메소드 입니다.");
		long startTime = System.nanoTime();
		try {
		  Object result = joinPoint.proceed();
		  return result;
		} finally {
			long endTime = System.nanoTime();
			long executionTime = endTime - startTime;
			System.out.println("수행시간 : "+executionTime+"ns");
		}
		
		
	}
	*/
}
