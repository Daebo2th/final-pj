package com.osoondosson.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ClassVO {
    private int groupSeq;
    private String groupName;
    private Date startDate;
    private Date endDate;
}
