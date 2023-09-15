package com.osoondosson.dao;

import com.osoondosson.vo.UserVO;

public interface MyPageDAO {
	public UserVO selectMyPage(String userId);
	public void updateMyPage(UserVO vo);

}
