package org.me.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BoardVo {

	private int bno;            // 게시글 번호
    private String title;       // 게시글 제목
    private String content;     // 게시글 내용
    private String writer;      // 게시글 작성자
    private Date regdate;       // 게시글 작성일자 util.Date
    private Date updatedate;        // 게시글 조회수
    
    // toString()
    @Override
    public String toString() {
        return "BoardVO [bno=" + bno + ", title=" + title + ", content=" + content + ", writer=" + writer + ", regdate="
                + regdate + ", updatedate=" + updatedate + "]";
    }
}
