package com.osca.controller;


import com.osca.dto.ListDTO;
import com.osca.dto.ReplyDTO;
import com.osca.service.ReplyService;
import com.osca.service.RequestService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.modelmapper.ModelMapper;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
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
    public Map<String, Integer> qaBoardRegister(@RequestBody ReplyDTO replyDTO){
        log.info("==========================================");
        log.info(replyDTO);

        int totalCount = replyService.register(replyDTO);
        return Map.of("result", totalCount);// 댓글 수도 반환해야지
    }

    @GetMapping("/test")
    public String[] get1(){
        return new String[]{"AAA","BBB","CCC"};

    }

    @GetMapping(value = "/list/{qaNo}", produces = MediaType.APPLICATION_JSON_VALUE)
    public List<ReplyDTO> getListOfConst(@PathVariable ("qaNo") Integer qaNo, ListDTO listDTO){

        log.info("reply list.." + listDTO);

        return replyService.getListOfContract(qaNo, listDTO);
    }

    @GetMapping(value = "/{rno}")
    public ReplyDTO getReplyDTO(@PathVariable("rno")Integer rno){

        ReplyDTO replyDTO = replyService.selectOneReply(rno);
        return replyDTO;
    }

    @PutMapping(value = "/{rno}")
    public Map<String, Integer> modify (@PathVariable ("rno")Integer rno, @RequestBody ReplyDTO replyDTO ){

        replyDTO.setRno(rno); //번호를 일치시킴

        replyService.updateReply(replyDTO);

        Map<String, Integer> resultMap = new HashMap<>();

        resultMap.put("rno", rno);

        return resultMap;

    }
    

}
