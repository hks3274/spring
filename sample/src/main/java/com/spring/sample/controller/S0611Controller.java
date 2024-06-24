package com.spring.sample.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.sample.vo.S0611VO;
import com.spring.sample.vo.S0612VO;

@Controller
@RequestMapping("/0611")
public class S0611Controller {
	
	// @GetMapping("/index")
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String getIndex() {
		
		return "0611/index";
	}
	
	@GetMapping("/test1")
	public String getTest1(HttpServletRequest request) {
		String mid = request.getParameter("mid");
		String pwd = request.getParameter("pwd");
		
		request.setAttribute("mid", mid);
		request.setAttribute("pwd", pwd);
		
		return "0611/test1";
	}
	
	@RequestMapping(value = "/test2", method = RequestMethod.GET)
	public String getTest2(String mid, String pwd, Model model, int age, int gender) {
		String strGender = "";
		if(gender == 1 || gender == 3) strGender = "남자";
		else strGender = "여자";
		
		model.addAttribute("mid", mid);
		model.addAttribute("pwd", pwd);
		model.addAttribute("age", age - 1);
		model.addAttribute("gender", strGender);
		
		return "0611/test2";
	}
	
	@RequestMapping(value = "/test3", method = RequestMethod.GET)
	public String getTest3(
			String mid, 
			String pwd, 
			Model model, 
			int age, 
			//@RequestParam(name="gender") int sex
			@RequestParam(name="gender", defaultValue = "2", required = false) int gender
		) {
		String strGender = "";
		if(gender == 1 || gender == 3) strGender = "남자";
		else strGender = "여자";
		
		model.addAttribute("mid", mid);
		model.addAttribute("pwd", pwd);
		model.addAttribute("age", age - 1);
		model.addAttribute("gender", strGender);
		
		return "0611/test3";
	}
	
	@RequestMapping(value = "/test4", method = RequestMethod.GET)
	public String getTest4(
			String mid, 
			String pwd, 
			Model model, 
			int age, 
			//@RequestParam(name="gender") int sex
			@RequestParam(name="gender", defaultValue = "2", required = false) int gender
			) {
		String strGender = "";
		if(gender == 1 || gender == 3) strGender = "남자";
		else strGender = "여자";
		
		S0611VO vo = new S0611VO();
		vo.setMid(mid);
		vo.setPwd(pwd);
		vo.setAge(age);
		vo.setStrGender(strGender);
		
		model.addAttribute("vo", vo);
		
		return "0611/test4";
	}
	
	@RequestMapping(value = "/test5", method = RequestMethod.GET)
	public String getTest5(S0611VO vo, Model model) {
		if(vo.getGender() == 1 || vo.getGender() == 3) vo.setStrGender("남자");
		else vo.setStrGender("여자");
		
		model.addAttribute("vo", vo);
		
		return "0611/test5";
	}
	
	@RequestMapping(value = "/test6", method = RequestMethod.GET)
	public ModelAndView getTest6(S0611VO vo) {
		ModelAndView mv = new ModelAndView("0611/test6");
		
		mv.addObject("vo", vo);
		
		// return "0611/test6";
		return mv;
	}
	
	@RequestMapping(value = "/test7", method = RequestMethod.POST)
	public ModelAndView postTest7(S0611VO vo, String name) {
		ModelAndView mv = new ModelAndView("0611/test7");
		
		mv.addObject("vo", vo);
		mv.addObject("name", name);
		
		// return "0611/test7";
		return mv;
	}
	
	/*
	//@RequestMapping(value = "/test8", method = RequestMethod.POST)
	@PostMapping("/test8")
	public ModelAndView getTest8(S0611VO vo,
			HttpServletRequest request) throws UnsupportedEncodingException {
		request.setCharacterEncoding("utf-8");
		
		String name = request.getParameter("name");
		
		ModelAndView mv = new ModelAndView("0611/test8");
		
		mv.addObject("vo", vo);
		mv.addObject("name", name);
		
		return mv;
	}
	*/
	
	@PostMapping("/test8")
	public ModelAndView getTest8(S0612VO vo, String name) {
		ModelAndView mv = new ModelAndView("0611/test8");
		
		System.out.println("vo : " + vo);
		
		mv.addObject("vo", vo);
		mv.addObject("name", name);
		
		return mv;
	}
	
	//@GetMapping("/test9")
	@RequestMapping(value = "/test9", method = RequestMethod.GET)
	public String getTest9() {
		return "0611/test9";
	}
	
	@RequestMapping(value = "/test9", method = RequestMethod.POST)
	public String postTest9(S0612VO vo, Model model) {
		System.out.println("vo : " + vo);
		model.addAttribute("vo", vo);
		return "0611/test9";
	}
	
	@RequestMapping(value = "/test10", method = RequestMethod.GET)
	public String getTest10() {
		return "0611/test10";
	}
	
	@RequestMapping(value = "/test10", method = RequestMethod.POST)
	public String postTest10(S0612VO vo, Model model) {
		String viewPage = "";
		if(vo.getMid().substring(0,1).equals("a")) {
			model.addAttribute("msg", "회원 가입되었습니다.");
			viewPage = "0611/test10Ok";
		}
		else {
			model.addAttribute("msg", "회원 가입실패~~");
			viewPage = "0611/test10";
		}
		
		model.addAttribute("vo", vo);
		
		return viewPage;
	}
	
	@RequestMapping(value = "/test11", method = RequestMethod.GET)
	public String getTest11(Model model,
			@RequestParam(name="name", defaultValue = "홍길동", required = false) String name,
			@RequestParam(name="nName", defaultValue = "홍장군", required = false) String nName,
			@RequestParam(name="age", defaultValue = "20", required = false) int age,
			@RequestParam(name="mid", defaultValue = "hkd1234", required = false) String mid,
			@RequestParam(name="pwd", defaultValue = "1234", required = false) String pwd,
			@RequestParam(name="strGender", defaultValue = "남자", required = false) String strGender,
			@RequestParam(name="msg", defaultValue = "", required = false) String msg
			) {
		
		model.addAttribute("name", name);
		model.addAttribute("nName", nName);
		model.addAttribute("age", age);
		model.addAttribute("mid", mid);
		model.addAttribute("pwd", pwd);
		model.addAttribute("strGender", strGender);
		model.addAttribute("msg", msg);
		System.out.println("회원 가입폼 창으로 이동....");
		return "0611/test11";
	}
	
	@RequestMapping(value = "/test11", method = RequestMethod.POST)
	public String postTest11(Model model, S0612VO vo) {
		
		if(vo.getMid().substring(0,1).equals("a")) {
			model.addAttribute("vo", vo);
			model.addAttribute("msg", "회원 가입되었습니다.");
			return "0611/test10Ok";
		}
		else {
			model.addAttribute("msg", "회원 가입실패~~");
			System.out.println("회원가입실패 통과....");
//			model.addAttribute("name", vo.getName());
//			model.addAttribute("nName", vo.getNName());
//			model.addAttribute("age", vo.getAge());
//			model.addAttribute("mid", vo.getMid());
//			model.addAttribute("pwd", vo.getPwd());
//			model.addAttribute("strGender", vo.getStrGender());
			
			return "redirect:/0611/test11";
		}
	}
	
	@RequestMapping(value = "/test12/{mid}/{pwd}", method = RequestMethod.GET)
	public String getTest12(Model model,
			@PathVariable String mid,
			@PathVariable String pwd
			) {
		
		model.addAttribute("mid", mid);
		model.addAttribute("pwd", pwd);
		
		return "0611/test12";
	}
	
	@GetMapping("/test13")
	public String getTest13() {
		return "0611/test13";
	}
	
	@GetMapping("/test13/{mid}/{pwd}")
	public String getTest13(Model model,
			@PathVariable String mid,
			@PathVariable String pwd
			) {
		model.addAttribute("mid", mid);
		model.addAttribute("pwd", pwd);
		
		return "0611/test13Ok";
	}
	
	@GetMapping("/test14")
	public String getTest14() {
		return "0611/test14";
	}
	
	//@GetMapping("/test14/{mid}-{pwd}")
	//@GetMapping("/test14/{mid}A{pwd}")
	//@GetMapping("/test14/{mid}______________________{pwd}")
	@GetMapping("/{mid}/test14/{pwd}")
	public String getTest14(Model model,
			@PathVariable String mid,
			@PathVariable String pwd
			) {
		model.addAttribute("mid", mid);
		model.addAttribute("pwd", pwd);
		
		return "0611/test14Ok";
	}
	
	@RequestMapping(value = "/test15", method = RequestMethod.GET)
	public String getTest15() {
		return "0611/test15";
	}
	
	@RequestMapping(value = "/test15", method = RequestMethod.POST)
	public String postTest15(S0612VO vo, Model model) {
		/*
		if(vo.getMid().substring(0,1).equals("a")) {
			model.addAttribute("vo", vo);
			model.addAttribute("msg", "회원 가입되었습니다.");
			model.addAttribute("url", "/0611/test15");
		}
		else {
			model.addAttribute("msg", "회원 가입실패~~");
			model.addAttribute("url", "/0611/index");
		}
		
		return "include/message";
		*/
		
		if(vo.getMid().substring(0,1).equals("a")) {
			//model.addAttribute("vo", vo);
//			model.addAttribute("msg", "회원 가입되었습니다.");
//			model.addAttribute("url", "/0611/test15");
			return "redirect:/message/memberInputOk?mid="+vo.getMid();
		}
		else {
//			model.addAttribute("msg", "회원 가입실패~~");
//			model.addAttribute("url", "/0611/index");
			return "redirect:/message/memberInputNo";
		}
		
		//return "include/message";
	}
}
