package com.osoondosson.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ReplyVO {
    private int replySeq; // 댓글 시퀀스
    private int taskSeq; // 글번호
    private String replyContent; //댓글내용
    private Date createDate; // 작성일
    private int parentReply; // 상위댓글번호
    private String replyer; // 작성자
}
