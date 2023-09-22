package com.osoondosson.controller;

import com.osoondosson.security.config.CustomUserDetail;
import com.osoondosson.service.GroupService;
import com.osoondosson.vo.ClassVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@Slf4j
public class GroupController {

    @Autowired
    private GroupService groupService;

    // 그룹을 조회할 수 있는 기능
    /**
     *
     * */
    @GetMapping("/teacher/class-info")
    public String getClassInfo(Model model, Authentication authentication){

        CustomUserDetail userDetail = (CustomUserDetail) authentication.getPrincipal();
        List<ClassVO> list = groupService.selectClass();
        log.error(list.toString());
        model.addAttribute("list",list) ;

        return "teacher/classInfo";
    }

    // 그룹을 생성 할 수 있는 기능
    @PostMapping("/api/class-add")
    @ResponseBody
    public Map<String,String> insertClass(@RequestBody ClassVO vo){
        Map<String, String> map = new HashMap<>();
        String status = "false";
        String msg = "그룹 생성 실패 하셧습니다";

        if(groupService.insertClass(vo)){
            status = "true";
            msg = "그룹이 생성되었습니다.";
        }


        map.put("status",status);
        map.put("msg", msg);

        return map;
    }

    // 그룹에 배정되지않은 사용자 조회
    @GetMapping("/teacher/nogroupuser")
    public String selectNullGroupUser(Model model){

        model.addAttribute("list",groupService.selectNullGroupUser());
        model.addAttribute("groupList", groupService.selectClass());
        return "teacher/classAsign";
    }

    // 그룹을 수정 할 수 있는 기능
    @PutMapping("/api/userclassupdate")
    @ResponseBody
    public Map<String,String> updateUserClassSeq(@RequestBody Map<String,String> map){
        Map<String, String> responseMap = new HashMap<>();
        log.error("그룹수정");
        String status = "false";
        String msg = "그룹 수정 실패 하셧습니다";
        if(groupService.updateClass(map)){
            status = "true";
            msg = "그룹이 수정되었습니다.";
        }

        responseMap.put("status",status);
        responseMap.put("msg", msg);

        return responseMap;
    }

}
