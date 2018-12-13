package com.swebchat.chat.controller;

import java.io.File;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.ModelAndView;

import com.swebchat.member.model.dto.MemberDTO;

@Controller
public class ChatController {

	@RequestMapping("/uni")
	public ModelAndView moveUni(ModelAndView mav, HttpServletRequest req) {
		
		mav.setViewName("chatView/unicast");
		
		MemberDTO myMember = (MemberDTO) req.getSession().getAttribute("dto");
		String myId = myMember.getId();
		String yourId = req.getParameter("yourId");
		
		mav.addObject("yourId", yourId);
		
		return mav;
	}
	
	@RequestMapping(value="/fileup", method=RequestMethod.POST)
	public ModelAndView fileUpload(ModelAndView mav, HttpServletRequest request, 
			@RequestPart MultipartFile file) {
		
		System.out.println("file : " + file);
		
		String savePath = request.getSession().getServletContext().getRealPath("resources/uploadFiles");
		System.out.println(savePath);
		String fileName = file.getOriginalFilename();
		
		try {
			File filePath = new File(savePath + "\\" + file.getOriginalFilename());
			
			file.transferTo(filePath);
			
			mav.addObject("fileName", fileName);
			mav.setViewName("jsonView");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return mav;
	}
	
	@RequestMapping("/mfdown")
	public ModelAndView fileDownMethod(ModelAndView mav, HttpServletRequest request, @RequestParam("ofile") String ofile) {
		
		String savePath = request.getSession().getServletContext().getRealPath("resources/uploadFiles");
		
		File originFile = new File(savePath + "\\" + ofile);
		
		mav.addObject("downFile", originFile);
		
		mav.setViewName("filedown");
		
		return mav;
	}
}
