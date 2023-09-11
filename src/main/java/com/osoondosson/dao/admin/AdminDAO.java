package com.osoondosson.dao.admin;

import com.osoondosson.vo.MemberWithClassVO;
import com.osoondosson.vo.UserVO;

import java.util.List;

public interface AdminDAO {

    List<MemberWithClassVO> selectByGroup(int groupSeq);
}
