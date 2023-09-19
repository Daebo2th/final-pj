package com.osoondosson.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.osoondosson.dao.BoardDAO;

@Service("BoardService")
public class BoardServiceImpl implements BoardService{

    @Autowired
    private BoardDAO boardDAO;

	@Override
	public int selectCountUser() {
		return boardDAO.selectCountUser();
	}

	@Override
	public List<Map<String, Object>> findStatusCount(int groupSeq) {
		return boardDAO.findStatusCount(groupSeq);
	}

	@Override
	public List<Map<String, Object>> findStatusNoCount(int groupSeq) {
		return boardDAO.findStatusNoCount(groupSeq);
	}

}
