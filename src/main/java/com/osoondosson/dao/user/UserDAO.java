package com.osoondosson.dao.user;

import com.osoondosson.vo.UserRoleVO;
import com.osoondosson.vo.UserVO;

import java.util.List;
import java.util.Map;

public interface UserDAO {
	List<UserVO> getUser();

	UserVO findById(String id);

	UserRoleVO findRoleById(String id);

	int insertUser(UserVO user);

	String getGroupSeqByUserId(String userId);

	UserVO read(String id);

	void updateProfile(UserVO vo);

	int getUserCountByIdAndName(UserVO vo);

}
