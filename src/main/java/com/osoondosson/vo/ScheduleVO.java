package com.osoondosson.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ScheduleVO {
    private int scheduleSeq; // 시퀀스
    private String userId;
    private String actType;
    private String title; // 제목
    private String xcontent; // 내용
    private Date startDate; // 시작일
    private Date endDate; // 종료일
    private String importance; // 중요도

    /*private String id;
    private String title;
    private String writer;
    private String content;
    private String start;
    private String end;
    private boolean allday;
    private String textColor;
    private String backgroundColor;
    private String borderColor;*/
}
