package com.osoondosson.controller;

import java.security.Principal;
import java.util.Map;

import com.osoondosson.security.config.CustomUserDetail;
import com.osoondosson.security.config.CustomUserDetailsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.osoondosson.service.MyPageService;
import com.osoondosson.vo.UserVO;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class MyPageController {

	@Autowired
	private MyPageService mypageService;

	@Autowired
	private CustomUserDetailsService customUserDetailsService;

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

		// 2. 현재 Authentication에 저장된 account의 age값 변경
		// 2-1. 현재 Authentication 정보 호출
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		CustomUserDetail userDetail = (CustomUserDetail) authentication.getPrincipal();

		// 2-2. 현재 Authentication로 사용자 인증 후 새 Authentication 정보를 SecurityContextHolder에 세팅
		SecurityContextHolder.getContext().setAuthentication(createNewAuthentication(authentication,userDetail.getUsername()));
	}

	/**
	 * @description 새로운 인증 생성
	 * @param currentAuth 현재 auth 정보
	 * @param username	현재 사용자 Id
	 * @return Authentication
	 * @author Armton
	 */
	protected Authentication createNewAuthentication(Authentication currentAuth, String username) {
		UserDetails newPrincipal = customUserDetailsService.loadUserByUsername(username);
		UsernamePasswordAuthenticationToken newAuth = new UsernamePasswordAuthenticationToken(newPrincipal, currentAuth.getCredentials(), newPrincipal.getAuthorities());
		newAuth.setDetails(currentAuth.getDetails());
		return newAuth;
	}

	@PostMapping("/changePw")
	public String updatePassWord(@RequestParam Map<String, Object> paramMap, Principal principal,
			RedirectAttributes ra) {
		paramMap.put("userId", principal.getName());

		// 현재 로그인한 사용의 비밀번호 새로운비밀번호로 바꾸고싶어
		// DB 현재 로그인중인 사용자의 비밀번호를 가져와서 프론트에서 보내준 현재 사용중인 비밀번호랑 일치한지 체크

		int result = mypageService.updatePassWord(paramMap);

		if (result > 0) {
			ra.addFlashAttribute("message", "비밀번호 변경 성공!");

		} else {
			ra.addFlashAttribute("message", "현재 비밀번호가 일치하지 않습니다.");

		}

		return "redirect:/student/MyPage";
	}

}
