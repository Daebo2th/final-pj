package com.osoondosson.dao;

import com.osoondosson.vo.ClassVO;
import com.osoondosson.vo.UserVO;

import java.util.List;
import java.util.Map;

public interface GroupDAO {
    List<ClassVO> selectClass();
    int insertClass(ClassVO vo);

    List<UserVO> selectNullGroupUser();

    int updateClass(Map<String, String> map);
}
