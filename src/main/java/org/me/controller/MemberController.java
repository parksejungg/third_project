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

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/member/*")
@Log4j
public class MemberController {
	
	@Autowired
	private MemberService service;
	
	@Autowired
	BCryptPasswordEncoder pwdEncode;
	
	
	//회원가입페이지 이동
	@RequestMapping(value ="/register", method = RequestMethod.GET)
	public String registerGET() {
		log.info("횐가입 페이지");
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
		log.info("로긴 페이지");
	}
	
	//로그인 작동
	@RequestMapping(value="/login", method = RequestMethod.POST)
	public String loginPOST(MemberVO memberVO, HttpServletRequest request, RedirectAttributes rttr) {
		
		HttpSession session = request.getSession();
		String rawPw = "";
		String encodePw = "";
		String loginId ="";
		
		// 저장되어 있는 이전 페이지 URL이 있다면
		String previousPage = (String) session.getAttribute("previousPage");
		
		MemberVO loginVo = service.memberLogin(memberVO);
		
		if(loginVo !=null) { // 일치하는 아이디가 존재한다면?
			rawPw = memberVO.getUserPw();
			encodePw = loginVo.getUserPw();
			loginId = loginVo.getUserId();
			
			if(true == pwdEncode.matches(rawPw, encodePw)) { // 비밀번호가 일치한다면
				loginVo.setUserPw("");
				session.setAttribute("member", loginVo); //세션에 사용자 정보 저장
				log.info("일반 사용자 로긴 성공");

	            if (previousPage != null) {
	            	log.info("세션 있음");
	                session.removeAttribute("previousPage");
	                
	                return "redirect:" + previousPage;
	            }
				
				if(loginId.equals("admin")) {
					session.setAttribute("member", loginVo);
					log.info("관리자 로긴 성공");
					
					return "redirect:/admin/adminMain";
				}
				
				return "redirect:/main.jsp";
			
			}else {
				rttr.addFlashAttribute("result",0);
				log.info("로긴 실패");
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
		log.info("로그아웃 매서드 ");
		
		HttpSession session = request.getSession();
		session.invalidate();
		
		return "redirect:/main";
		
	}
	
	//비동식 방식 로그아웃
	@RequestMapping(value="/logout" , method=RequestMethod.POST)
	@ResponseBody
	public void logoutPOST(HttpServletRequest request) {
		log.info("비동기 로그아웃 매서드 ");
		
		HttpSession session = request.getSession();
		session.invalidate();
		
	}
	
   // 추가한 거 !
   @RequestMapping(value = "/checkLogin", method = RequestMethod.GET)
   @ResponseBody
   public String checkLogin(HttpSession session) {
       MemberVO member = (MemberVO) session.getAttribute("member");

       if (member != null) {
//           String userName = member.getUserName(); // userName 값 가져오기
           return "true"; // 로그인 상태인 경우
       } else {
           return "false"; // 로그인하지 않은 상태인 경우
       }
   }
	
	
	
	
	  
}