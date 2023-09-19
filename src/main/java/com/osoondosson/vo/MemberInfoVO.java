package com.osoondosson.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MemberInfoVO {
    private String id; // 아이디
    private String name; // 이름
    private String nickname; // 닉네임
    private Date regDate; // 가입일
    private String phone; // 전화번호
    private String gender; // 성별
    private Date Birthday; // 생일
    private String addr; // 주소
    private byte[] profile; // 프로필
}
