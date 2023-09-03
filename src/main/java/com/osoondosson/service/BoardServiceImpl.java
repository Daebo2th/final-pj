package com.osoondosson.service;

import com.osoondosson.dao.BoardDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoardServiceImpl {

    @Autowired
    private BoardDAO boardDAO;

}
