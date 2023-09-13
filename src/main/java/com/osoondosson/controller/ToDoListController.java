package com.osoondosson.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.osoondosson.service.ToDoListService;
import com.osoondosson.vo.ToDoListVO;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class ToDoListController {
	
	@Autowired
	private ToDoListService todolistService;
	
	@PostMapping("/insertToDoList")
	@ResponseBody
	public void insertToDoList(@RequestBody ToDoListVO vo, Principal principal) {
		vo.setUserId(principal.getName());
		todolistService.insertToDoList(vo);
	}
	// http://localhost:8080/student/todolist
	@GetMapping("/student/todolist")
	public String selectToDoList(Model model) {
		model.addAttribute("list", todolistService.selectToDoList());
		
		return "/student/todolist";
	}
	
	@PostMapping("/updateToDoList")
	@ResponseBody
	public void updateToDoList(@RequestBody ToDoListVO vo) {
		System.out.println("--------------------------------------------" + vo);
		todolistService.updateToDoList(vo);
	}
	
	@PostMapping("/deleteToDoList")
	@ResponseBody
	public void deleteToDoList(@RequestBody ToDoListVO vo) {
		System.out.println("--------------------------------------------" + vo);
		todolistService.deleteToDoList(vo);
	}
	
	@PostMapping("/cardTaxisUpdate")
	@ResponseBody
	public void cardTaxisUpdate(@RequestBody ToDoListVO vo) {
		todolistService.cardTaxisUpdate(vo);
	}

}
