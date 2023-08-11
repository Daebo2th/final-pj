package com.osoondosson.service;

import com.osoondosson.dao.TestDAO;
import com.osoondosson.vo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TestServiceImpl  implements TestService{

    @Autowired
    private TestDAO testDAO;
    @Override
    public List<User> getUser() {
        return testDAO.getUser();
    }
}
