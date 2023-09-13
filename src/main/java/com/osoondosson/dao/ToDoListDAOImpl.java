package com.osoondosson.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.osoondosson.vo.ToDoListVO;

@Repository("ToDoListDAO")
public class ToDoListDAOImpl implements ToDoListDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	@Override
	public void insertToDoList(ToDoListVO vo) {
		System.out.println("==> mybatis insertToDoList() 호출 ");
		mybatis.insert("com.osoondosson.dao.ToDoListDAO.insertToDoList", vo);
	}

	@Override
	public List<ToDoListVO> selectToDoList() {
		System.out.println("==> mybatis selectToDoList() 호출 ");
		return mybatis.selectList("com.osoondosson.dao.ToDoListDAO.selectToDoList");
	}

	@Override
	public void updateToDoList(ToDoListVO vo) {
		System.out.println("==> mybatis updateToDoList() 호출 ");
		mybatis.update("com.osoondosson.dao.ToDoListDAO.updateToDoList", vo);
	}

	@Override
	public void deleteToDoList(ToDoListVO vo) {
		System.out.println("==> mybatis deleteToDoList() 호출 ");
		mybatis.delete("com.osoondosson.dao.ToDoListDAO.deleteToDoList", vo);
		
	}

	@Override
	public void cardTaxisUpdate(ToDoListVO vo) {
		System.out.println("==> mybatis cardTaxisUpdate() 호출 ");
		mybatis.update("com.osoondosson.dao.ToDoListDAO.cardTaxisUpdate", vo);
	}

}
