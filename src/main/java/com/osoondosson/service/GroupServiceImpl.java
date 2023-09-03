package com.osoondosson.service;

import com.osoondosson.dao.GroupDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class GroupServiceImpl {

    @Autowired
    private GroupDAO groupDAO;
}
