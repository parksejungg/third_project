package org.me.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.me.service.BoardService;
import org.me.vo.BoardVo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import lombok.RequiredArgsConstructor;

@Controller // 현재 클래스를 컨트롤러 빈(bean)으로 등록
@RequiredArgsConstructor
public class BoardController {

	private final BoardService boardService;

	// 01. 게시글 목록
	// 특정 uri로 요청을 보내면 Controller에서 어떠한 방식으로 처리할지 정의
	/**
	 * @RequestMapping(value = "/hello-basic")
 이렇게 매핑을 하면 localhost:8080/hello-basic으로 url을 입력했을 경우에 이것에 해당하는 메서드가 실행된다.
	 */
	@RequestMapping(value = "/list.do")
	//  ModelAndView는 데이터와 이동하고자 하는 View Page를 같이 저장한다
	public ModelAndView list() {

		List<BoardVo> list = boardService.listAll();
		
		// ModelAndView - 모델과 뷰
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("/board/list"); // 뷰를 list.jsp로 설정
		mav.addObject("list", list); // 데이터를 저장
		
		return mav; // list.jsp로 List가 전달된다.
	}
	
	// 02_01. 게시글 작성화면
	@RequestMapping(value = "/board/write.do", method = RequestMethod.GET)
	public ModelAndView insertPage(@ModelAttribute BoardVo vo) {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/board/write");
		
		return mav; 
	}

	// 02_02. 게시글 작성
	@RequestMapping(value = "/board/insert.do", method = RequestMethod.POST)
	public String insert(@ModelAttribute BoardVo vo) {
		
		boardService.create(vo);
		
		return "redirect:/list.do";
	}

	// 03. 게시글 상세내용 조회, 게시글 조회수 증가 처리
	// @RequestParam
	@RequestMapping(value = "/board/view.do", method = RequestMethod.GET)
	public ModelAndView view(@RequestParam int bno) {
		// 모델(데이터)+뷰(화면)를 함께 전달하는 객체
		ModelAndView mav = new ModelAndView();
		// 뷰의 이름
		mav.setViewName("board/view");
		// 뷰에 전달할 데이터
		mav.addObject("dto", boardService.read(bno));
		
		return mav;
	}

	// 04. 게시글 수정
	// 폼에서 입력한 내용들은 @ModelAttribute BoardVo vo로 전달됨
	@RequestMapping(value = "/board/update.do", method = RequestMethod.POST)
	public String update(@ModelAttribute BoardVo vo) {
		
		boardService.update(vo);
		
		return "redirect:/list.do";
	}

	// 05. 게시글 삭제
	@RequestMapping("/board/delete.do")
	public String delete(@RequestParam int bno) {
		
		boardService.delete(bno);
		
		return "redirect:/list.do";
	}

}
