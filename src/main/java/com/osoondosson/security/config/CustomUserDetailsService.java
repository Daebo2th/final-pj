package com.osoondosson.security.config;

import com.osoondosson.dao.user.UserDAO;
import com.osoondosson.vo.UserVO;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

@Slf4j
public class CustomUserDetailsService implements UserDetailsService {

    @Setter(onMethod_ = {@Autowired})
    private UserDAO userDAO;

    @Override
    public UserDetails loadUserByUsername(String id) throws UsernameNotFoundException {
        log.warn("-----------시큐리티 커스텀 로그인 처리 시작-------------" + id);
        UserVO vo = userDAO.read(id);
        if(vo==null){
            throw new UsernameNotFoundException("No user found for "+ id + ".");
        }
        log.warn("-----------시큐리티 커스텀 로그인 처리   끝-------------");
        return vo == null ? null : new CustomUserDetail(vo);
    }
}
//