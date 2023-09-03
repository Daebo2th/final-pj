package com.osoondosson.service;

import com.osoondosson.dao.ReplyDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReplyServiceImpl {

    @Autowired
    private ReplyDAO replyDAO;
}
