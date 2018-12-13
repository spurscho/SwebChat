package com.swebchat.member.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.swebchat.member.model.dto.MemberDTO;
import com.swebchat.member.model.service.MemberService;

@Controller
@SessionAttributes("dto")
public class MemberController {
	
	@Autowired
	private MemberService service;

	@RequestMapping("/mainPage")
	public ModelAndView mainView(ModelAndView mav) {
		
		mav.setViewName("member/join");
		
		return mav;
	}
	
	//회원가입
	@RequestMapping(value="/join")
	public String insertMember(HttpSession session) {
		
		return "/member/join";
	}
	
	//중복체크
	@RequestMapping(value="/checkUserId")
	@ResponseBody
	public Map<Object, Object> checkUserID(@RequestBody String id) throws Exception {

		int count = 0;
		Map<Object, Object> map = new HashMap<Object, Object>();

		count = service.selectUserId(id);
		map.put("cnt", count);

		return map;
	}
	
	@RequestMapping(value="/join_ok", method=RequestMethod.POST)
	public String join_ok(MemberDTO dto) {
	
		service.insertMember(dto);

		return "redirect:/login";
	}
	
	@RequestMapping(value = "/login")
	public String login(HttpSession session) {
		
		return "member/login";
	}
	@RequestMapping(value="/login_ok", method =RequestMethod.POST)
	public ModelAndView login_ok(MemberDTO dto, HttpSession session, ModelAndView mav) {
		dto = service.loginMember(dto);
		System.out.println("dto : " + dto);
		if (dto == null) {
			mav.setViewName("redirect:/login");
			return mav;
		} else {
			session.setAttribute("id", dto.getId());
			mav.addObject("dto", dto);
			mav.setViewName("redirect:/list");
			return mav;
		}
	}

	@RequestMapping(value="/logout", method=RequestMethod.GET)	
	public String logout(SessionStatus status) {
		status.setComplete();
		return "redirect:/login";
	}

	@RequestMapping(value="/updated", method=RequestMethod.GET)
	public String updated(HttpSession session, MemberDTO dto) {
		String id = (String) session.getAttribute("id");
		dto.setId(id);

		if (id == null) {
			return "member/login";
		} else {
			return "member/updated";
		}
	}
	
	@RequestMapping(value="/updated_ok", method=RequestMethod.POST) 
	public String updated_ok(MemberDTO dto, HttpSession session) {
		String id = (String) session.getAttribute("id");
		
		dto.setId(id);
		service.updateMember(dto);
		
		return "redirect:/list";
	}
	
	@RequestMapping(value="/deleted" , method=RequestMethod.GET)
	public String deleted(HttpSession session, MemberDTO dto) {
		String id = (String) session.getAttribute("id");
		dto.setId(id);

		if (id == null) {
			return "member/login";
		} else {
			return "member/deleted";
		}
	}

	@RequestMapping(value="/deleted_ok", method=RequestMethod.POST)
	public String deleted_ok(MemberDTO dto, HttpSession session) {
		
		String id = (String) session.getAttribute("id");
		dto.setId(id);

		service.deleteMember(dto);
		
		session.removeAttribute("id");
		session.invalidate();

		return "redirect:/login";
	}

	@RequestMapping("/list")
	public String getList(HttpSession session, MemberDTO dto,HttpServletRequest req, HttpServletResponse res) throws Exception{
		MemberDTO result = service.loginMember(dto);
		
		List<MemberDTO> lists = service.getMemberList();
		
		MemberDTO myInfo = (MemberDTO) req.getSession().getAttribute("dto");
		System.out.println("myInfo : " + myInfo);
		String myName = myInfo.getId();
		
		ArrayList<MemberDTO> list = new ArrayList<MemberDTO>();
		
		for(MemberDTO m : lists) {
			if(!m.getId().equals(myName)) {
				list.add(m);
			}
		}
		
		req.setAttribute("lists", list);
		req.setAttribute("myId", myName);
		return "member/memberList";
	}
	
	@RequestMapping("/applyChatPopup")
	public String applyChat(String yourId,HttpServletRequest req,HttpSession session) throws Exception{
		
		//String myId = (String) session.getAttribute("id");
		String myId = "my";
		
		req.setAttribute("myId", myId);
		req.setAttribute("yourId",yourId);
		
		return "member/applyPopup";
	}
}