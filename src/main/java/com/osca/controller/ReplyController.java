package com.osca.controller;


import com.osca.dto.ReplyDTO;
import com.osca.service.ReplyService;
import com.osca.service.RequestService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.modelmapper.ModelMapper;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/replies/")
@Log4j2
@RequiredArgsConstructor
public class ReplyController {

    private final ReplyService replyService;
    private final ModelMapper modelMapper;

    private final RequestService requestService;

    @PostMapping("/")
    public Map<String, String> qaBoardRegister(@RequestBody ReplyDTO replyDTO){
        log.info("==========================================");
        log.info(replyDTO);

        replyService.register(replyDTO);
        return Map.of("result", "success");
    }

    @GetMapping("/test")
    public String[] get1(){
        return new String[]{"AAA","BBB","CCC"};

    }

    @GetMapping(value = "/list/{qaNo}", produces = MediaType.APPLICATION_JSON_VALUE)
    public List<ReplyDTO> getListOfConst(@PathVariable ("qaNo") Integer qaNo){

        return replyService.getListOfContract(qaNo);
    }

    

}
