package com.osoondosson.service;

import com.osoondosson.vo.UserVO;
import org.springframework.security.core.userdetails.User;

import java.util.List;
import java.util.Map;

public interface UserService {
    List<UserVO> getUser();
    boolean insertUser(UserVO user);

    UserVO findById(String id);

    String getGroupSeqByUserId(String userId);

    boolean getUserCountByIdAndName(UserVO vo);
}
