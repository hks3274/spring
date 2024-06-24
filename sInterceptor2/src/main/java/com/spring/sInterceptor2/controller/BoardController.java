package com.spring.sInterceptor2.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
@RequestMapping("/board")
public class BoardController {

	@RequestMapping(value = "/boardList", method = RequestMethod.GET)
	public String getBoardList(Model model) {
		System.out.println("이곳은 board컨트롤러의 boardList메소드 입니다.");
		
		model.addAttribute("data", "board컨트롤러의 boardList메소드에서 보냅니다.");
		
		return "board/boardList";
	}
	
	@RequestMapping(value = "/boardInput", method = RequestMethod.GET)
	public String getBoardInput(Model model) {
		System.out.println("이곳은 board컨트롤러의 boardInput메소드 입니다.");
		model.addAttribute("data", "board컨트롤러의 boardInput메소드에서 보냅니다.");
		return "board/boardInput";
	}
	
	@RequestMapping(value = "/boardUpdate", method = RequestMethod.GET)
	public String getBoardUpdate(Model model) {
		System.out.println("이곳은 board컨트롤러의 boardUpdate메소드 입니다.");
		model.addAttribute("data", "board컨트롤러의 boardUpdate메소드에서 보냅니다.");
		return "board/boardUpdate";
	}
	
	@RequestMapping(value = "/boardDelete", method = RequestMethod.GET)
	public String getBoardDelete(Model model) {
		System.out.println("이곳은 board컨트롤러의 boardDelete메소드 입니다.");
		return "redirect:/message/boardDeleteOk";
	}
	
}
