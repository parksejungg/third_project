package org.me.dao;

import java.util.List;

import org.me.vo.BoardVo;

public interface BoardDAO {

	// 01. 게시글 작성
    public void create(BoardVo vo);
    
    // 02. 게시글 상세보기
    public BoardVo read(int bno);
    
    // 03. 게시글 수정
    public void update(BoardVo vo);
    
    // 04. 게시글 삭제
    public void delete(int bno);
    
    // 05. 게시글 전체 목록
    public List<BoardVo> listAll();
    
}
