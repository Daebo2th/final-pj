package com.osoondosson.security.config;

import com.osoondosson.vo.UserVO;
import lombok.*;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.stream.Collectors;

@Getter

public class CustomUserDetail extends User {

    private int groupSeq;
    private String name;
    private Date regDate;
    private String profile;

    public CustomUserDetail() {
        super("", "", new ArrayList<>());
    }

    public CustomUserDetail(String username, String password, Collection<? extends GrantedAuthority> authorities) {
        super(username, password, authorities);
    }

    public CustomUserDetail(UserVO vo) {
        super(vo.getUserId(), vo.getUserPwd(), vo.getAuthList().stream().map(auth -> new SimpleGrantedAuthority(auth.getRoleType())).collect(Collectors.toList()));

        this.groupSeq = vo.getGroupSeq();
        this.name = vo.getName();
        this.regDate = vo.getRegDate();
        this.profile = vo.getProfile();
    }
}
