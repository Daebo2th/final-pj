package com.osoondosson.service;

import com.osoondosson.vo.UserVO;

import java.util.List;

public interface UserService {
    List<UserVO> getUser();
    boolean insertUser(UserVO user);
}
