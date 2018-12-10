package com.swebchat.member.controller;

import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
public class MemberController {
	
	@Autowired
	private MemberService service;

	@RequestMapping(value="/join", method=RequestMethod.POST)
	public ModelAndView insertMember(MemberDTO dto, ModelAndView mav) {
		
		mav.setViewName("/member/join");//
		mav.addObject("dto", "dto");
		
		return mav;
	}
	
	@RequestMapping("/list.do")
	public String getList(HttpServletRequest req, HttpServletResponse res) throws Exception{
		
		List<MemberDTO> lists = service.getMemberList();
		
		req.setAttribute("lists", lists);
		return "./member/memberList";
	}
}