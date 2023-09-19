package com.osoondosson.dao.admin;

import com.osoondosson.vo.MemberWithClassVO;
import com.osoondosson.vo.UserVO;

import java.util.List;
import java.util.Map;

public interface AdminDAO {

    List<MemberWithClassVO> selectByGroup(Map<String, Object> map);

    int countStudent(Map<String, Object> map);
}
