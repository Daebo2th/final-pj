package com.osoondosson.dao;

import java.util.Map;

import com.osoondosson.vo.UserVO;

public interface MyPageDAO {
	public UserVO selectMyPage(String userId);
	public void updateMyPage(UserVO vo);
	public String selectPassWord(String userId);
	public int updatePassWord(Map<String, Object> paramMap);

}
