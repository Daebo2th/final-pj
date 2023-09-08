package com.osoondosson.dao.user;

import com.osoondosson.dao.TestDAO;
import com.osoondosson.vo.UserRoleVO;
import com.osoondosson.vo.UserVO;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository
@Slf4j
public class UserDAOImpl implements UserDAO{

    @Autowired
    private SqlSession mybatis;

    @Override
    public List<UserVO> getUser() {
        List<UserVO> list = new ArrayList<>();

        try {
            TestDAO dao = mybatis.getMapper(TestDAO.class);
            list = dao.getUser();
        } catch (Exception e) {
            log.error(e.getMessage());
        }

        return list;
    }

    @Override
    public UserVO findById(String id) {
        UserVO user = new UserVO();
        try {
            UserDAO dao = mybatis.getMapper(UserDAO.class);
            user = dao.findById(id);
        }catch (Exception e){
            log.error(e.getMessage());
        }
        return user;
    }

    @Override
    public UserRoleVO findRoleById(String id) {
        UserRoleVO userRole = new UserRoleVO();

        try {
            UserDAO dao = mybatis.getMapper(UserDAO.class);
            userRole = dao.findRoleById(id);
        } catch (Exception e){
            log.error(e.getMessage());
        }
        return userRole;
    }

    @Override
    public int insertUser(UserVO user) {
        int result = 0;
        log.info(user.toString());
        try {
            UserDAO dao = mybatis.getMapper(UserDAO.class);
            result = dao.insertUser(user);
        } catch (Exception e) {
            log.error(e.getMessage());
        }

        return result;
    }
}
