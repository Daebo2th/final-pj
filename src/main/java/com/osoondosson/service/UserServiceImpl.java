package com.osoondosson.service;

import com.osoondosson.dao.user.UserDAO;
import com.osoondosson.vo.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

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
        return userDAO.insertUser(user) > 0 ? true : false;
    }

    @Override
    public UserVO findById(String id) {
        return userDAO.findById(id);
    }

    @Override
    public String getGroupSeqByUserId(String userId) {
        System.out.println("userService 까지 옴 ~~~~~~~~~~~");
        return userDAO.getGroupSeqByUserId(userId);
    }

    @Override
    public boolean getUserCountByIdAndName(UserVO vo) {
        return userDAO.getUserCountByIdAndName(vo) > 0 ? true : false;
    }
}
