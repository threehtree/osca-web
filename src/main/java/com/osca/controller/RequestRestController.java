package com.osca.controller;

import com.osca.dto.ContractDTO;
import com.osca.service.RequestService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequiredArgsConstructor
@Log4j2
@RequestMapping("/request")
public class RequestRestController {
    private final RequestService requestService;

    @PostMapping("/write")
    public String reqWritePost(ContractDTO contractDTO) {

        requestService.reqInsert(contractDTO);
        return "redirect:/request/list";
    }
    @PostMapping("/contract")
    public String reqContract(ContractDTO contractDTO, RedirectAttributes rttr){
        log.info("contract :"+ contractDTO);

        requestService.reqContract(contractDTO);

        rttr.addFlashAttribute("result", "Constracting");

        return "redirect:/request/list";

    }
    @PostMapping("/delContract")
    public String reqDelContract(Integer conNo, RedirectAttributes rttr){


        requestService.reqDelContract(conNo);

        rttr.addFlashAttribute("result", "delConstracting");

        return "redirect:/request/list";

    }
//    @PostMapping("/modify/{conNo}")
//    public String reqModify(@PathVariable("conNO")Integer conNo, ContractDTO contractDTO){
//        contractDTO.setConNo(conNo);
//        requestService.reqUpdate(contractDTO);
//        return "redirect:/request/detail/${contractDTO.getConNo()}";
//    }
// todo 뭐가 문제일까ㅏㅏㅏㅏㅏ



}
