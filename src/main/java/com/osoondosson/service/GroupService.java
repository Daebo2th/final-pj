package com.osoondosson.service;

import com.osoondosson.vo.ClassVO;
import com.osoondosson.vo.UserVO;

import java.util.List;
import java.util.Map;

public interface GroupService {
    List<ClassVO> selectClass();

    boolean insertClass(ClassVO vo);

    List<UserVO> selectNullGroupUser();
    
    boolean updateClass(Map<String, String> map);
}
