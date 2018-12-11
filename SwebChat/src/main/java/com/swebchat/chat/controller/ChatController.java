package com.swebchat.chat.controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ChatController {

	@RequestMapping("/uni")
	public ModelAndView moveUni(ModelAndView mav) {
		
		mav.setViewName("chatView/unicast");
		
		return mav;
	}
	
	@RequestMapping(value="fileup", method=RequestMethod.POST)
	public ModelAndView fileUpload(ModelAndView mav,HttpServletRequest request, @RequestParam(name="file")	MultipartFile file) {
		
		String savePath = request.getSession().getServletContext().getRealPath("resources/uploadFiles");
		
		String fileName = file.getOriginalFilename();
		
		try {
			File filePath = new File(savePath + "\\" + file.getOriginalFilename());
			
			file.transferTo(filePath);
			
			mav.addObject("fileName", fileName);
			mav.setViewName("member/join");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return mav;
	}
}
