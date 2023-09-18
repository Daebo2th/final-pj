package com.osoondosson.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.osoondosson.vo.UserVO;

public interface BoardService {
	int selectCountUser();
	List<Map<String, Object>> findStatusCount(int groupSeq);
	List<Map<String, Object>> findStatusNoCount(int groupSeq);
}
