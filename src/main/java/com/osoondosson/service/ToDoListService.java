package com.osoondosson.service;

import java.util.List;

import com.osoondosson.vo.ToDoListVO;

public interface ToDoListService {
	void insertToDoList(ToDoListVO vo);
	List<ToDoListVO> selectToDoList(String userId);
	void updateToDoList(ToDoListVO vo);
	void deleteToDoList(ToDoListVO vo);
	void cardTaxisUpdate(ToDoListVO vo);
}
