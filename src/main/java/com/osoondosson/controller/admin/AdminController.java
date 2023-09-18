package com.osoondosson.controller.admin;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.osoondosson.security.config.CustomUserDetail;
import com.osoondosson.service.AdminServiceImpl;
import com.osoondosson.service.BoardServiceImpl;
import com.osoondosson.vo.MemberWithClassVO;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class AdminController {

    @Autowired
    private AdminServiceImpl adminService;
    
    @Autowired
    private BoardServiceImpl boardService;
    
	/*
	 * @GetMapping("/admin") public String selectCountUser(Model model) { int user =
	 * boardService.selectCountUser(); model.addAttribute("user", user); return
	 * "index"; }
	 */
    
    @GetMapping("/admin")
    public String findStatusCount(Model model, Authentication authentication) {
    	CustomUserDetail detail= (CustomUserDetail) authentication.getPrincipal();
    	List<Map<String, Object>> count = boardService.findStatusCount(detail.getGroupSeq());
    	List<Map<String, Object>> noCount = boardService.findStatusNoCount(detail.getGroupSeq());
    	model.addAttribute("user", boardService.selectCountUser());
    	model.addAttribute("count", count);
    	model.addAttribute("noCount", noCount);
    	return "index";
    }

    @GetMapping("/admin/student-record")
    public String stuRecord(Model model) {
        List<MemberWithClassVO> list = adminService.selectByGroup(1);
        System.out.println("리스트: " + list);
        model.addAttribute("list", list);
        return "admin/student-record";
    }

    @GetMapping("/admin/student-detail")
    public String stuDetail(Model model) {
        List<MemberWithClassVO> list = adminService.selectByGroup(1);
        System.out.println("리스트: " + list);
        model.addAttribute("list", list);
        return "admin/student-detail";
    }
}
