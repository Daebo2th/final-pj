package com.osoondosson.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.osoondosson.vo.UserVO;

public interface BoardDAO {
	public int selectCountUser();
	public List<Map<String, Object>> findStatusCount(int groupSeq);
	public List<Map<String, Object>> findStatusNoCount(int groupSeq);
}
