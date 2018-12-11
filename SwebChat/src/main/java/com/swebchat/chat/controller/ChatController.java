package com.swebchat.chat.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ChatController {

	@RequestMapping("/uni")
	public ModelAndView moveUni(ModelAndView mav) {
		
		mav.setViewName("chatView/unicast");
		
		return mav;
	}
}
