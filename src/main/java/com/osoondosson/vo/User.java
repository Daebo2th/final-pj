package com.osoondosson.vo;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

import java.util.Date;

@NoArgsConstructor
@AllArgsConstructor
public class User {

    private String uId;
    private String pwd;
    private Date regdate;

    public void setuId(String uId) {
        this.uId = uId;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public void setRegdate(Date regdate) {
        this.regdate = regdate;
    }

    public String getuId() {
        return uId;
    }

    public String getPwd() {
        return pwd;
    }

    public Date getRegdate() {
        return regdate;
    }
}
