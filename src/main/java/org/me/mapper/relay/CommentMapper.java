package org.me.mapper.relay;

import java.util.List;

import org.me.domain.relay.dto.CommentDto;
import org.springframework.stereotype.Repository;

@Repository
public interface CommentMapper {
	
	void insert(CommentDto commentDto);
	
	public List<CommentDto> findAll(int bno);

	void update(CommentDto commentDto);

	void delete(int rno);
}