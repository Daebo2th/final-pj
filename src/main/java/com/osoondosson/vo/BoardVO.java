package com.osoondosson.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BoardVO {
    private int boardSeq; // 글번호
    private String auther; // 작성자
    private String title; // 제목
    private String content; // 내용
    private Date createDate; // 작성일
    private Date updateDate; // 수정일
    private int count; // 조회수
    private int likesCount; // 좋아요 수
}
