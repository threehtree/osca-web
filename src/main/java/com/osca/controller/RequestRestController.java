package com.osca.controller;

import com.osca.dto.ContractDTO;
import com.osca.service.RequestService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequiredArgsConstructor
@RequestMapping("/request")
public class RequestRestController {
    private final RequestService requestService;

    @PostMapping("/write")
    public String reqWritePost(ContractDTO contractDTO) {

        requestService.reqInsert(contractDTO);
        return "redirect:/request/list";
    }

}
