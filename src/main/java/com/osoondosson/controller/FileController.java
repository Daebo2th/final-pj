package com.osoondosson.controller;

import com.osoondosson.service.FileService;
import com.osoondosson.service.FileServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
@Slf4j
public class FileController {

    @Autowired
    private FileServiceImpl fileService;

}
