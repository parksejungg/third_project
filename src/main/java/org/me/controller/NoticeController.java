package org.me.controller; 

import org.me.domain.NoticeVO;
import org.me.service.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/notice/*")
@Log4j

public class NoticeController {
	
	@Autowired
	private NoticeService service;
	
	// 글목록
	@GetMapping("/list")
	public ModelAndView boardList(Model model) {
		
		log.info("글목록 페이지");
		model.addAttribute("list", service.getList());
		
		return new ModelAndView("/notice/list");
		
	}
	
	// 글조회
	@GetMapping("/read")
	public void reviewBoardGET(int bno, Model model) {
		
		model.addAttribute("read", service.getNotice(bno));
	}
	
	// 글등록 페이지로 이동
	@GetMapping("/insert")
	public void board() {
		log.info("글쓰는 페이지");
	}
	
	//글등록
	@PostMapping("/insert")
	public String insertBoard(NoticeVO notice, RedirectAttributes rttr) {

		if (notice.getTitle().isEmpty() || notice.getContent().isEmpty()) {
			rttr.addFlashAttribute("result", "insert failed");
		} else {
			service.insertNotice(notice);
			rttr.addFlashAttribute("result", "insert success");
		}
		
		return "redirect:/notice/list";
	}
	
	
	
	// 글수정 페이지로 이동
	@GetMapping("/modify")
	public void modify(int bno, Model model) {
		
		log.info("글 수정 페이지");
		model.addAttribute("modify", service.getNotice(bno));
	}
	
	// 글 수정
	@PostMapping("/modify")
	public String modifyPOST(NoticeVO notice, RedirectAttributes rttr) {
		
		service.modify(notice);
		rttr.addFlashAttribute("result", "modify success");
		
		log.info("글 수정 완료");
		
		return "redirect:/notice/list";
	}
	
	//글 삭제
	@PostMapping("/delete")
	public String deletePOST(int bno, RedirectAttributes rttr) {
		
		service.deleteNotice(bno);
		
		rttr.addFlashAttribute("result", "delete success");
		
		return "redirect:/notice/list";
	}
	
}
