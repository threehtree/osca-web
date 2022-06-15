package com.osca.controller;

import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
@Log4j2
public class CommonController {

    @GetMapping("/accessError")
    public void accessError(){

    }
    @GetMapping("/customLogin")
    public void loginGET(){

    }

}
