package com.osoondosson.service;

import com.osoondosson.dao.user.UserDAO;
import com.osoondosson.vo.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDAO userDAO;

    @Override
    public List<UserVO> getUser() {
        return userDAO.getUser();
    }

    @Override
    public boolean insertUser(UserVO user) {
        return userDAO.insertUser(user) > 0?true:false;
    }
}
