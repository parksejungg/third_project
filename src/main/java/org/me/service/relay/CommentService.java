package org.me.service.relay;

import java.util.List;

import org.me.domain.relay.dto.CommentDto;
import org.me.mapper.relay.CommentMapper;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CommentService {

	private final CommentMapper commentMapper;

	public List<CommentDto> findAll(int bno) {
		
		return commentMapper.findAll(bno);
	}
	
	public void insert(CommentDto commentDto) {
		
		commentMapper.insert(commentDto);
	}

	public void update(CommentDto commentDto) {
		
		commentMapper.update(commentDto);
	}
	
	public void delete(int rno) {
		
		commentMapper.delete(rno);
	}
}