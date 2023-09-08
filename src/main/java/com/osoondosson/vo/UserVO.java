package com.osoondosson.vo;

import lombok.*;
import org.springframework.format.annotation.DateTimeFormat;

import java.sql.Blob;
import java.util.Date;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class UserVO {

    private String userId;
    private int groupSeq;
    private String token;
    private String userPwd;
    private String name;
    private Date regDate;
    private String phone;
    private String gender;
    @DateTimeFormat(pattern = "yyyy-MM-dd hh:mm:ss")
    private Date birthday;
    private String addr1;
    private String addr2;
    private Blob profile;

}
