package com.osoondosson.service;

import com.osoondosson.dao.admin.AdminDAO;
import com.osoondosson.dao.user.UserDAO;
import com.osoondosson.vo.MemberWithClassVO;
import com.osoondosson.vo.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminServiceImpl implements AdminService{

    @Autowired
    private AdminDAO adminDAO;

    @Override
    public List<MemberWithClassVO> selectByGroup(int groupSeq) {
        return adminDAO.selectByGroup(groupSeq);
    }
}
