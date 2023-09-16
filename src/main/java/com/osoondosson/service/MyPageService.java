package com.osoondosson.service;

import java.util.Map;

import com.osoondosson.vo.UserVO;

public interface MyPageService {
	UserVO selectMyPage(String userId);
	void updateMyPage(UserVO vo);
	String selectPassWord(String userId);
	int updatePassWord(Map<String, Object> paramMap);

}
