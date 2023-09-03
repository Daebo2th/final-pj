package com.osoondosson.controller;

import com.osoondosson.service.UserServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
@Slf4j
public class UserController {

    @Autowired
    private UserServiceImpl userService;
}
