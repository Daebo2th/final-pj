package com.osoondosson.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
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

	@Override
	public String selectPassWord(String userId) {
		return mypageDAO.selectPassWord(userId);
	}

	@Override
	public int updatePassWord(Map<String, Object> paramMap) {
	    String encPw = mypageDAO.selectPassWord((String)paramMap.get("userId")); // 현재 로그인중인 사용자의 비밀번호를 가져옴 암호화
	    BCryptPasswordEncoder bCrypt = new BCryptPasswordEncoder(); // qwe $2a$10$/Zi4I9297SNh866jhkkmvOctsn5JkDCimZY5vW9L6zaoJW/JAIGuG

	    if (bCrypt.matches((String)paramMap.get("password"), encPw)) { // currentPassword 랑 DB에 있는 pwd 비교 참
	        paramMap.put("userPwd", bCrypt.encode((String)paramMap.get("newpassword"))); // 새로운 비밀번호를 
	        
	        return mypageDAO.updatePassWord(paramMap);
	    }
	    return 0;
	}

	

}
