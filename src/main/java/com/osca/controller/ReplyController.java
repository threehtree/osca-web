package com.osca.controller;


import com.osca.dto.ReplyDTO;
import com.osca.service.ReplyService;
import com.osca.service.RequestService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.modelmapper.ModelMapper;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/replies/")
@Log4j2
@RequiredArgsConstructor
public class ReplyController {

    private final ReplyService replyService;
    private final ModelMapper modelMapper;

    private final RequestService requestService;

    @GetMapping("/test")
    public String[] get1(){
        return new String[]{"AAA","BBB","CCC"};

    }

    @GetMapping(value = "/list/{conNo}", produces = MediaType.APPLICATION_JSON_VALUE)
    public List<ReplyDTO> getListOfConst(@PathVariable ("conNo") Integer conNo){

        return replyService.getListOfContract(conNo);
    }

    

}
