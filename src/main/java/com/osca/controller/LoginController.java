package com.osca.controller;

import com.osca.dto.ContractDTO;
import com.osca.dto.ListDTO;
import com.osca.dto.ListResponseDTO;
import com.osca.dto.PageMaker;
import com.osca.service.RequestService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@Log4j2
@RequiredArgsConstructor
@RequestMapping("/")
public class LoginController {
    private final RequestService requestService;

    @GetMapping("/")
    public String login(){
        return "login";
    }

    @GetMapping("/register")
    public void register(){


    }
    @GetMapping("/list")
    public void contractList(ListDTO listDTO, Model model){
        // MemberDTO - 나중에 시큐리티에서 가져옴
        String memberId = "123"; // TODO 구글 로그인에서 받아온 이메일로 멤버테이블에서 멤버DTO를 가져오고 그 멤버 DTO에서 멤버ID를가져옴
        ListResponseDTO<ContractDTO> contractDTOListResponseDTO = requestService.getContractList(listDTO, memberId);
        List<ContractDTO> dtoList = contractDTOListResponseDTO.getDtoList();
        model.addAttribute("reqDTO", dtoList);
        model.addAttribute("isEmpty", dtoList.isEmpty());
        model.addAttribute("pageMaker",new PageMaker(listDTO.getPage(), contractDTOListResponseDTO.getTotal()));

    }
    @GetMapping("/read/{conNo}")
    public String contractRead(@PathVariable("conNo") Integer conNo, ListDTO listDTO, Model model){

        ContractDTO oneDTO = requestService.getRequestOne(conNo);
        model.addAttribute("reqDTO", oneDTO);

        return "/read";
    }
    @GetMapping("/modify/{conNo}")
    public String contractModify(@PathVariable("conNo") Integer conNo, ListDTO listDTO, Model model){

        ContractDTO oneDTO = requestService.getRequestOne(conNo);
        model.addAttribute("reqDTO", oneDTO);

        return "/modify";
    }
    @PostMapping("/modify/{conNo}")
    public String contractModifyPost(@PathVariable("conNo") Integer conNo,ContractDTO contractDTO, ListDTO listDTO, Model model){

        requestService.reqUpdate(contractDTO);

        return "redirect:/read/"+conNo;
    }

}
