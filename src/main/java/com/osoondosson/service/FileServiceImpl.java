package com.osoondosson.service;

import com.osoondosson.dao.FileDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FileServiceImpl {

    @Autowired
    private FileDAO fileDAO;
}
