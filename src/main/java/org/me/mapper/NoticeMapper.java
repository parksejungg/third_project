package org.me.mapper;

import java.util.List;

import org.me.domain.NoticeVO;

public interface NoticeMapper {

	// 등록 메서드
	public void insertNotice(NoticeVO board);
	
	// 글 조회 메서드
	public NoticeVO getNotice(int bno);
	
	// 글 목록 메서드
    public List<NoticeVO> getList();
    
    // 글 수정 메서드
    public int modify(NoticeVO board);
    
    
    // 글 삭제 메서드
    public int deleteNotice(int bno);
	
	
}
