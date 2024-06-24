package com.spring.sInterceptor2.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
@RequestMapping("/admin")
public class adminController {

	@RequestMapping(value = "/boardList", method = RequestMethod.GET)
	public String getBoardList(Model model) {
	
		model.addAttribute("data", "admin컨트롤러의 boardList메소드에서 보냅니다.");
		
		return "admin/boardList";
	}
	
	@RequestMapping(value = "/guestList", method = RequestMethod.GET)
	public String getGuestList(Model model) {

		model.addAttribute("data", "admin컨트롤러의 guestList메소드에서 보냅니다.");
		
		return "admin/guestList";
	}
	
	@RequestMapping(value = "/pdsList", method = RequestMethod.GET)
	public String getPdsList(Model model) {

		model.addAttribute("data", "admin컨트롤러의 pdsList메소드에서 보냅니다.");
		
		return "admin/pdsList";
	}
	

	
}
