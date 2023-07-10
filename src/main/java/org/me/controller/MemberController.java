package org.me.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.me.domain.MemberVO;
import org.me.service.MemberService;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/member/*")

public class MemberController {
	
	@Inject	
	private MemberService service;
	
	@Autowired
	BCryptPasswordEncoder pwdEncode;
	
	
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
		System.out.println("로그인 페이지");
		return null;
	}
	
	
	@RequestMapping(value="/login", method = RequestMethod.POST)
	public String loginPOST(MemberVO memberVO, HttpServletRequest request, RedirectAttributes rttr) {
		
		HttpSession session = request.getSession();
		String rawPw = "";
		String encodePw = "";
		
		MemberVO loginVo = service.memberLogin(memberVO);
		
		if(loginVo !=null) { // 일치하는 아이디가 존재한다면?
			rawPw = memberVO.getUserPw();
			encodePw = loginVo.getUserPw();
			
			if(true == pwdEncode.matches(rawPw, encodePw)) { // 비밀번호가 일치한다면
				loginVo.setUserPw("");
				session.setAttribute("member", loginVo); //세션에 사용자 정보 저장
				return "redirect:/";
			}else {
				rttr.addFlashAttribute("result",0);
				return "redirect:/member/login;";
			}
		
		}else { //일치하는 아이디 존재 하지 않을 시 
			
			rttr.addFlashAttribute("result",0);
			return "redirect:/member/login;";
		}
	}
	
	
	
	  
}