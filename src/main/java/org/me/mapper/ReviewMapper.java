package org.me.mapper;

import java.util.List;

import org.me.domain.ReviewVO;

public interface ReviewMapper {

	// 등록 메서드
	public void insertBoard(ReviewVO board);
	
	// 글조회 메서드
	public ReviewVO selectBoard(int bno);
	
	// 글목록 메서드
    public List<ReviewVO> selectAllBoards();
    
    // 글 수정 메서드
    public int modify(ReviewVO board);
    
    
    // 글 삭제 메서드
    public void deleteBoard(int bno);
	
	
}
