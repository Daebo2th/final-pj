package com.osoondosson.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
@Data
@NoArgsConstructor
@AllArgsConstructor
public class TaskVO {
    private int taskSeq;
    private String userId; // 로그인한 userId 값
    private String author;
    private String title;
    private String content;
    private Date createDate;
    private Date updateDate;
    private String status;

}

