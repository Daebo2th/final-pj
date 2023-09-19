package com.osoondosson.vo;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


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
    private String profile;
    private String groupName;
    private List<UserRoleVO> authList;


}
