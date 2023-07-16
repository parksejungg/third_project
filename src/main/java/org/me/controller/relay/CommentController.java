package org.me.controller.relay;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.me.domain.relay.dto.CommentDto;
import org.me.service.relay.CommentService;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
@RequestMapping(value="/relay/comment")
public class CommentController {

	private final CommentService commentService;
	
	@GetMapping(value="/list/{bno}")
	public List<CommentDto> list(@PathVariable int bno) {
		
		return commentService.findAll(bno);
	}
	
	@PostMapping(value="/insert")
	public void insert(CommentDto commentDto) {
		
		commentService.insert(commentDto);
	}
	
	@PostMapping(value="/update")
	public void update(CommentDto commentDto) {
		System.out.println("commentDto:" + commentDto.toString());
		
		commentService.update(commentDto);
	}
	
	@PostMapping(value="/delete")
	public void delete(@RequestParam int rno) {
		
		commentService.delete(rno);
	}
}