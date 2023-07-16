package org.me.service.relay;

import java.util.List;

import org.me.domain.relay.dto.BoardDto;
import org.me.mapper.relay.BoardMapper;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class BoardService {

	private final BoardMapper boardMapper;
	
	public List<BoardDto> findAll() {
		
		return boardMapper.findAll();
	}

	public void insert(BoardDto boardDto) {
		
		boardMapper.insert(boardDto);
	}

	public BoardDto findOne(int bno) {
		
		return boardMapper.findOne(bno);
	}

	public void update(BoardDto boardDto) {
		
		System.out.println(boardDto);
		
		boardMapper.update(boardDto);
	}

	public void delete(int bno) {
		
		boardMapper.delete(bno);
	}

}