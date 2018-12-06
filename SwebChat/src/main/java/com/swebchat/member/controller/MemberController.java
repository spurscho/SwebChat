package com.swebchat.member.controller;

import javax.servlet.ServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.swebchat.member.model.dto.MemberDTO;
import com.swebchat.member.model.service.MemberService;

@Controller
@SessionAttributes("loginMemberDTO")//세션유지
public class MemberController {
	
	@Autowired
	private MemberService service;

	@RequestMapping(value="/join", method=RequestMethod.POST)
	public ModelAndView insertMember(MemberDTO dto, ModelAndView mav) {
		
		mav.setViewName("/member/join");//뷰의 이름
		mav.addObject("dto", "dto");
		
		return mav;
	}
}