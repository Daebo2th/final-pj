package com.osoondosson.service;

import com.osoondosson.dao.GroupDAO;
import com.osoondosson.vo.ClassVO;
import com.osoondosson.vo.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class GroupServiceImpl implements GroupService{

    @Autowired
    private GroupDAO groupDAO;

    @Override
    public List<ClassVO> selectClass() {
        return groupDAO.selectClass();
    }

    @Override
    public boolean insertClass(ClassVO vo) {
        return groupDAO.insertClass(vo)>0?true:false;
    }

    @Override
    public List<UserVO> selectNullGroupUser() {
        return groupDAO.selectNullGroupUser();
    }

    @Override
    public boolean updateClass(Map<String, String> map) {
        return groupDAO.updateClass(map)>0?true:false;
    }
}
