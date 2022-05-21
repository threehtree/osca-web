package com.osca.controller;

import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@Log4j2
@RequestMapping("/request")
public class RequestController {

    @GetMapping("/list")
    public void reqList(){

    }

    @GetMapping("/write")
    public void reqWrite(){

    }
    @GetMapping("/detail/{reqId}")
    public void reqDetail(){

    }
    @GetMapping("/list/on/{reqId}")
    public void reqOn(@PathVariable ("reqId") Integer reqId){

    }



}
