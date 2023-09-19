package com.osoondosson.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.osoondosson.dao.ToDoListDAO;
import com.osoondosson.vo.ToDoListVO;

@Service("ToDoListService")
public class ToDoListServiceImpl implements ToDoListService {
	
	@Autowired
	private ToDoListDAO todolistDAO;

	@Override
	public void insertToDoList(ToDoListVO vo) {
		todolistDAO.insertToDoList(vo);
		
	}

	@Override
	public List<ToDoListVO> selectToDoList(String userId) {
		return todolistDAO.selectToDoList(userId);
	}

	@Override
	public void updateToDoList(ToDoListVO vo) {
		todolistDAO.updateToDoList(vo);
	}

	@Override
	public void deleteToDoList(ToDoListVO vo) {
		todolistDAO.deleteToDoList(vo);
	}

	@Override
	public void cardTaxisUpdate(ToDoListVO vo) {
		todolistDAO.cardTaxisUpdate(vo);
	}


}
