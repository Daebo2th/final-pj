package com.osoondosson.service;

import com.osoondosson.vo.UserVO;

public interface MyPageService {
	UserVO selectMyPage(String userId);
	void updateMyPage(UserVO vo);

}
