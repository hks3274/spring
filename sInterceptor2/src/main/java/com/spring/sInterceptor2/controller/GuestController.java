package com.spring.sInterceptor2.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
@RequestMapping("/guest")
public class GuestController {

	@RequestMapping(value = "/guestList", method = RequestMethod.GET)
	public String getGuestList(Model model) {
		model.addAttribute("data", "guest컨트롤러의 guestList메소드에서 보냅니다.");
		return "guest/guestList";
	}
	
	@RequestMapping(value = "/guestInput", method = RequestMethod.GET)
	public String getGuestInput(Model model) {
		model.addAttribute("data", "guest컨트롤러의 guestInput메소드에서 보냅니다.");
		return "guest/guestInput";
	}
	
	@RequestMapping(value = "/guestUpdate", method = RequestMethod.GET)
	public String getGuestUpdate(Model model) {
		model.addAttribute("data", "guest컨트롤러의 guestUpdate메소드에서 보냅니다.");
		return "guest/guestUpdate";
	}
	
	@RequestMapping(value = "/guestDelete", method = RequestMethod.GET)
	public String getGuestDelete(Model model) {
		return "redirect:/message/guestDeleteOk";
	}
	
}
