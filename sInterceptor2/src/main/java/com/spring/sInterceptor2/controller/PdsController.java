package com.spring.sInterceptor2.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
@RequestMapping("/pds")
public class PdsController {

	@RequestMapping(value = "/pdsList", method = RequestMethod.GET)
	public String getPdsList(Model model) {
		model.addAttribute("data", "pds컨트롤러의 pdsList메소드에서 보냅니다.");
		return "pds/pdsList";
	}
	
	@RequestMapping(value = "/pdsInput", method = RequestMethod.GET)
	public String getPdsInput(Model model) {
		model.addAttribute("data", "pds컨트롤러의 pdsInput메소드에서 보냅니다.");
		return "pds/pdsInput";
	}
	
	@RequestMapping(value = "/pdsUpdate", method = RequestMethod.GET)
	public String getPdsUpdate(Model model) {
		model.addAttribute("data", "pds컨트롤러의 pdsUpdate메소드에서 보냅니다.");
		return "pds/pdsUpdate";
	}
	
	@RequestMapping(value = "/pdsDelete", method = RequestMethod.GET)
	public String getPdsDelete() {
		return "redirect:/message/pdsDeleteOk";
	}
	
	@RequestMapping(value = "/pdsDownload", method = RequestMethod.GET)
	public String getPdsDownload() {
		
		return "redirect:/message/pdsDownloadOk";
	}
	
}
