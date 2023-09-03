package com.osoondosson.service;

import com.osoondosson.dao.MemberInfoDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberInfoServiceImpl {

    @Autowired
    private MemberInfoDAO memberInfoDAO;
}
