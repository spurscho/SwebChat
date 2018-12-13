package com.swebchat.member.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.test.annotation.Commit;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
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
	
	@RequestMapping(value="/join")
	public String insertMember(HttpSession session) {
		
		return "/member/join";
	}
	
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
	public String login_ok(MemberDTO dto, HttpSession session) {
		MemberDTO result = service.loginMember(dto);

		if (result == null) {
			return "redirect:/login";
		} else {
			session.setAttribute("id", dto.getId());
			return "redirect:/list";
		}
	}

	@RequestMapping(value="/logout", method=RequestMethod.GET)	
	public String logout(HttpSession session) {
		session.removeAttribute("id");
		session.invalidate();
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
	public String getList(HttpSession session,MemberDTO dto,HttpServletRequest req, HttpServletResponse res) throws Exception{
		MemberDTO result = service.loginMember(dto);
		
		if(result == null) {
			return "redirect:/login";
		}else {
			session.setAttribute("myId", dto.getId());
			List<MemberDTO> lists = service.getMemberList();
			req.setAttribute("lists", lists);
			return "member/memberList";
		}
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