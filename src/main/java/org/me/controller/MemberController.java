package org.me.controller;

import javax.inject.Inject;

import org.me.domain.MemberVO;
import org.me.service.MemberService;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/member/*")

public class MemberController {
	
	@Inject	
	private MemberService service;
	
	//회원가입페이지
	@RequestMapping(value ="/register", method = RequestMethod.GET)
	public String registerGET() {
		System.out.println("횐가입 페이쥐ㅣ");
		return "/member/register";
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registerPOST(MemberVO memberVO, RedirectAttributes redirectAttributes)
	  throws Exception {
	  
	  String hashedPw = BCrypt.hashpw(memberVO.getUserPw(), BCrypt.gensalt());
	  memberVO.setUserPw(hashedPw);
	  service.register(memberVO); 
	  redirectAttributes.addFlashAttribute("msg", "REGISTERED");
	  
	  
	  return "/member/login"; 
	 
	}
	
	//로그인 페이지
	@RequestMapping(value="/login", method = RequestMethod.GET)
	public String loginGET() {
		System.out.println("로그인 페이즤");
		return "/member/login";
	}
	
	
	  
}
