package com.osoondosson.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
@Data
@NoArgsConstructor
@AllArgsConstructor
public class TaskVO {
    private String author;
    private String title;
    private String content;
    private Date createDate;
    private Date updateDate;
    private String status;

}

