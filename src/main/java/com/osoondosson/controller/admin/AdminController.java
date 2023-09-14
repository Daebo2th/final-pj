package com.osoondosson.controller.admin;

import com.osoondosson.service.AdminServiceImpl;
import com.osoondosson.service.UserServiceImpl;
import com.osoondosson.vo.MemberWithClassVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.List;

@Controller
@Slf4j
public class AdminController {

    @Autowired
    private AdminServiceImpl adminService;

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
