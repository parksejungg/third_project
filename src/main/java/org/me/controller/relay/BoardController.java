package org.me.controller.relay;

import java.util.List;

import org.me.domain.relay.dto.BoardDto;
import org.me.service.relay.BoardService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping(value="/relay/board")
public class BoardController {

	private final BoardService boardService;

	@GetMapping(value = "/list.do")
	public ModelAndView list() {

		List<BoardDto> list = boardService.findAll();

		ModelAndView mav = new ModelAndView();

		mav.setViewName("/board/list");
		mav.addObject("list", list); 

		return mav;
	}

	@GetMapping(value = "/write.do")
	public ModelAndView write() {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("/board/write");

		return mav;
	}

	@PostMapping(value = "/insert.do")
	public String insert(BoardDto boardDto) { // 메소드명 오른쪽에 적는 파라미터는 받는 값
		System.out.println("boardDto:"+boardDto.toString());

		boardService.insert(boardDto); // 메소드를 호출할 떄 적는 파라미터는 넘겨주는 값

		return "redirect:/relay/board/list.do"; // 리다이렉트 뒤에 리퀘스트 맵핑 값을 적어주므로써 새로운 API를 호출
	}

	@GetMapping(value="/view.do")
	public ModelAndView findOne(@RequestParam int bno) {
		
		BoardDto boardDto = boardService.findOne(bno);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("board/view");
		mav.addObject("dto", boardDto);

		return mav;
	}

	@PostMapping(value="/update.do")
	public String update(BoardDto vo) {

		boardService.update(vo);

		return "redirect:/relay/board/list.do";
	}

	@PostMapping(value="/delete.do")
	public String delete(@RequestParam int bno) {

		boardService.delete(bno);

		return "redirect:/relay/board/list.do";
	}
}