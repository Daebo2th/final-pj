package com.osoondosson.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ScheduleVO {
    private int seq; // 시퀀스
    private String title; // 제목
    private String type; // 일정타입
    private Date startDate; // 시작일
    private Date endDate; // 종료일
    private String importance; // 중요도
}
