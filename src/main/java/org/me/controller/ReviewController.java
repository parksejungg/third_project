package org.me.controller; 

import org.me.domain.ReviewVO;
import org.me.service.ReviewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sun.org.apache.xpath.internal.operations.Mod;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/review/*")
@Log4j
public class ReviewController {
	
	
	@Autowired
	private ReviewService reviewservice;
	
	// 글목록
	@GetMapping("/list")
	public void boardList(Model model) {
		model.addAttribute("list", reviewservice.getList());
	}
	
	// 글등록
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
	
	
	// 글조회
	@GetMapping("/read")
	public void reviewBoardGET(int bno, Model model) {
		
		model.addAttribute("read", reviewservice.getBoard(bno));
	}
	
	
	
	
	// 글수정
	@GetMapping("/modify")
	public void modify(int bno, Model model) {
		model.addAttribute("modify", reviewservice.getBoard(bno));
	}
	
	@PostMapping("/modify")
	public String ModifyPOST(ReviewVO board, RedirectAttributes rttr) {
		
		reviewservice.modify(board);
		
		rttr.addFlashAttribute("result", "modify success");
		
		return "redirect:/review/list";
	}
	
}
