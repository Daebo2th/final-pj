package com.osoondosson.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MemberWithClassVO { // member + class join한 vo
        private int rownum;
        private String name;
        private String phone;
        private String gender;
        private String groupName;
        private Date startDate;
        private Date endDate;

}
