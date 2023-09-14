package com.osoondosson.service;

import com.osoondosson.vo.UserVO;
import org.springframework.security.core.userdetails.User;

import java.util.List;

public interface UserService {
    List<UserVO> getUser();
    boolean insertUser(UserVO user);

    UserVO findById(String id);
}
