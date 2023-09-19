package com.osoondosson.service;

import com.osoondosson.dao.admin.AdminDAO;
import com.osoondosson.dao.user.UserDAO;
import com.osoondosson.vo.MemberWithClassVO;
import com.osoondosson.vo.TaskVO;
import com.osoondosson.vo.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class AdminServiceImpl implements AdminService{

    @Autowired
    private AdminDAO adminDAO;

    @Override
    public List<MemberWithClassVO> selectByGroup(Map<String, Object> map) {

        List<MemberWithClassVO> selectByGroup =adminDAO.selectByGroup(map);

        // rownum 값 설정
        int start= (int) map.get("start");
        for (int i=0; i<selectByGroup.size(); i++) {
            MemberWithClassVO memberWithClassVO=selectByGroup.get(i);
            int rownum=start+i;
            memberWithClassVO.setRownum(rownum);
        }

        return selectByGroup;
    }

    public int countStudent(Map<String, Object> map) {
        return adminDAO.countStudent(map);
    }
}
