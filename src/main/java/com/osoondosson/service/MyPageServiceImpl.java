package com.osoondosson.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.osoondosson.dao.MyPageDAO;
import com.osoondosson.vo.UserVO;

@Service("MyPageService")
public class MyPageServiceImpl implements MyPageService {
	
	@Autowired
	private MyPageDAO mypageDAO;

	@Override
	public UserVO selectMyPage(String userId) {
		return mypageDAO.selectMyPage(userId);
	}

	@Override
	public void updateMyPage(UserVO vo) {
		mypageDAO.updateMyPage(vo);
		
	}
	

}
