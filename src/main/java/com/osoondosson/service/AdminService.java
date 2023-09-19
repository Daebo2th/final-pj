package com.osoondosson.service;

import com.osoondosson.vo.MemberWithClassVO;
import com.osoondosson.vo.UserVO;

import java.util.List;
import java.util.Map;

public interface AdminService {
    List<MemberWithClassVO> selectByGroup(Map<String, Object> map);
    int countStudent(Map<String, Object> map);

}
