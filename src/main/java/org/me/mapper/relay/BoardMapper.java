package org.me.mapper.relay;

import java.util.List;

import org.me.domain.relay.dto.BoardDto;

public interface BoardMapper {
	
	public void insert(BoardDto boardDto);
	
	public List<BoardDto> findAll();
	
	public BoardDto findOne(int bno);
	
	public void update(BoardDto boardDto);
	
	public void delete(int bno);
	
}