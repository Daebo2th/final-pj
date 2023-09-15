package com.osoondosson.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.osoondosson.service.MyPageService;
import com.osoondosson.vo.UserVO;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class MyPageController {

	@Autowired
	private MyPageService mypageService;

//	@GetMapping("/student/MyPage")
//	public String MyPageMain(Model model, Principal principal) {
//		model.addAttribute("userId", principal.getName());
//		return "/student/MyPage";
//	}

	@GetMapping("/student/MyPage")
	public String selectMyPage(Model model, Principal principal) {
		String userId = principal.getName();
		UserVO user = mypageService.selectMyPage(userId);
		model.addAttribute("mypage", user);
		return "/student/MyPage";
	}
	
	@PostMapping("/updateMyPage")
	@ResponseBody
	public void updateMyPage(@RequestBody UserVO vo, Principal principal) {
		String userId = principal.getName();
		vo.setUserId(userId);
		System.out.println("--------------------------------------------------------" + vo);
		mypageService.updateMyPage(vo);
	}

}
