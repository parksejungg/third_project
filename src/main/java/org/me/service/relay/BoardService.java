package org.me.service.relay;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.me.domain.MemberVO;
import org.me.domain.relay.dto.BoardDto;
import org.me.mapper.relay.BoardMapper;
import org.me.mapper.relay.CommentMapper;
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
		
		boardMapper.update(boardDto);
	}

	public void delete(int bno) {
		
		// 글에 속한 댓글을 먼저 삭제한다.
		boardMapper.deleteComment(bno);
		
		// 글 삭제
		boardMapper.deleteBoard(bno);
	}
}