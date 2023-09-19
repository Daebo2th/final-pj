package com.osoondosson.dao;

import java.util.List;

import com.osoondosson.vo.ToDoListVO;

public interface ToDoListDAO {
	public void insertToDoList(ToDoListVO vo);
	public List<ToDoListVO> selectToDoList(String userId);
	public void updateToDoList(ToDoListVO vo);
	public void deleteToDoList(ToDoListVO vo);
	public void cardTaxisUpdate(ToDoListVO vo);
}
