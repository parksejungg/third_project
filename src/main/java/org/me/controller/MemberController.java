package org.me.controller;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/member/*")

public class MemberController {
	
	@Autowired
	private MemberService service;
	
	@Autowired
	BCryptPasswordEncoder pwdEncode;
	
	
	//회원가입페이지 이동
	@RequestMapping(value ="/register", method = RequestMethod.GET)
	public String registerGET() {
		System.out.println("횐가입 페이쥐ㅣ");
		return "/member/register";
	}
	
	//회원가입
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registerPOST(MemberVO memberVO, RedirectAttributes redirectAttributes)
	  throws Exception {
	  
		
	  String hashedPw = BCrypt.hashpw(memberVO.getUserPw(), BCrypt.gensalt());
	  memberVO.setUserPw(hashedPw);
	  service.join(memberVO); 
	  redirectAttributes.addFlashAttribute("msg", "REGISTERED");
	  
	  return "redirect:/member/login"; 
	 
	}
	
	//회원가입 아이디 중복체크
	@RequestMapping(value="/idCheck", method=RequestMethod.POST)
	@ResponseBody
	public String idCheckPOST(String userId) {
		int result =service.idCheck(userId);
		if(result != 0 ) {
			return "fail"; //중복 아이디 존재
		}else {
			return "success"; //중복 아이디 없음
		}
	}
	
	//로그인 페이지
	@RequestMapping(value="/login", method = RequestMethod.GET)
	public void loginGET() {
		System.out.println("로그인 페이지");
	}
	
	//로그인 작동
	@RequestMapping(value="/login", method = RequestMethod.POST)
	public String loginPOST(MemberVO memberVO, HttpServletRequest request, RedirectAttributes rttr) {
		
		HttpSession session = request.getSession();
		String rawPw = "";
		String encodePw = "";
		String loginId ="";
		
		MemberVO loginVo = service.memberLogin(memberVO);
		
		if(loginVo !=null) { // 일치하는 아이디가 존재한다면?
			rawPw = memberVO.getUserPw();
			encodePw = loginVo.getUserPw();
			loginId = loginVo.getUserId();
			
			if(true == pwdEncode.matches(rawPw, encodePw)) { // 비밀번호가 일치한다면
				loginVo.setUserPw("");
				session.setAttribute("member", loginVo); //세션에 사용자 정보 저장
				System.out.println("로그인 됨");
				
				if(loginId.equals("admin")) {
					session.setAttribute("member", loginVo);
					System.out.println("관리자 로긴");
					
					return "redirect:/admin/adminMain";
				}
				
				return "redirect:/main.jsp";
			
			}else {
				rttr.addFlashAttribute("result",0);
				System.out.println("로그인 안돼");
				return "redirect:/member/login";
			}
		
		}else { //일치하는 아이디 존재 하지 않을 시 
			
			rttr.addFlashAttribute("result",0);
			System.out.println("로그인 안돼");
			return "redirect:/member/login";
		}
	}
	
	//메뉴바 로그아웃
	@RequestMapping(value="/logout" , method=RequestMethod.GET)
	public String logoutGET(HttpServletRequest request) {
		System.out.println("로그아웃 메서드 진입");
		
		HttpSession session = request.getSession();
		session.invalidate();
		
		return "redirect:/main";
		
	}
	
	//비동식 방식 로그아웃
	@RequestMapping(value="/logout" , method=RequestMethod.POST)
	@ResponseBody
	public void logoutPOST(HttpServletRequest request) {
		System.out.println("비동기 로그아웃 메서드 진입");
		
		HttpSession session = request.getSession();
		session.invalidate();
		
	}
	
	
	
	
	  
}