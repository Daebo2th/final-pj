package com.osoondosson.dao;

import java.util.List;
import java.util.Map;

import com.osoondosson.vo.UserVO;

public interface BoardDAO {
	public int selectCountUser(int groupSeq);
	public List<Map<String, Object>> findStatusCount(int groupSeq);
	public List<Map<String, Object>> findStatusNoCount(int groupSeq);
	public List<Map<String, Object>> selectMyTask(UserVO vo);
	public List<Map<String, Object>> selectMyTaskStatus(UserVO vo);
	public int countTasks(int groupSeq);
	public int countTasksOk(int groupSeq);
}
