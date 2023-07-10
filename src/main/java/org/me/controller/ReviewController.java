package org.me.controller; 

import org.me.domain.ReviewVO;
import org.me.service.ReviewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/review/*")
@Log4j
public class ReviewController {
	
	
	@Autowired
	private ReviewService reviewservice;
	
	
	@GetMapping("/list")
	public void boardList() {
		System.out.println("게시판 목록 !!");
	}
	
	@GetMapping("/insert")
	public void board() {
		System.out.println("게시판 등록 !");
	}
	
	
	@PostMapping("/insert")
	public String insertBoard(ReviewVO board, RedirectAttributes rttr) {
		log.info("게시글 등록 : " + board);
		reviewservice.insertBoard(board);
		
		rttr.addFlashAttribute("result", "insert Success");

		return "redirect:/review/list";
	}
}
