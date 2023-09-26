package com.osoondosson.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.osoondosson.dao.BoardDAO;
import com.osoondosson.vo.UserVO;

@Service("BoardService")
public class BoardServiceImpl implements BoardService{

    @Autowired
    private BoardDAO boardDAO;

	@Override
	public int selectCountUser(int groupSeq) {
		return boardDAO.selectCountUser(groupSeq);
	}

	@Override
	public List<Map<String, Object>> findStatusCount(int groupSeq) {
		return boardDAO.findStatusCount(groupSeq);
	}

	@Override
	public List<Map<String, Object>> findStatusNoCount(int groupSeq) {
		return boardDAO.findStatusNoCount(groupSeq);
	}

	@Override
	public List<Map<String, Object>> selectMyTask(UserVO vo) {
		return boardDAO.selectMyTask(vo);
	}

	@Override
	public List<Map<String, Object>> selectMyTaskStatus(UserVO vo) {
		return boardDAO.selectMyTaskStatus(vo);
	}

	@Override
	public int countTasks(int groupSeq) {
		return boardDAO.countTasks(groupSeq);
	}

	@Override
	public int countTasksOk(int groupSeq) {
		return boardDAO.countTasksOk(groupSeq);
	}

}
