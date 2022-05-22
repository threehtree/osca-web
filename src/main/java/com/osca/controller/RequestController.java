package com.osca.controller;

import com.osca.dto.ContractDTO;
import com.osca.dto.ListDTO;
import com.osca.dto.ListResponseDTO;
import com.osca.service.RequestService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@Log4j2
@RequiredArgsConstructor
@RequestMapping("/request")
public class RequestController {
    private final RequestService requestService;


    @GetMapping("/list")
    public void reqList(ListDTO listDTO, Model model){
        // MemberDTO - 나중에 시큐리티에서 가져옴
        String memberId = "123"; // TODO 구글 로그인에서 받아온 이메일로 멤버테이블에서 멤버DTO를 가져오고 그 멤버 DTO에서 멤버ID를가져옴
        ListResponseDTO<ContractDTO> contractDTOListResponseDTO = requestService.getContractList(listDTO, memberId);
        List<ContractDTO> dtoList = contractDTOListResponseDTO.getDtoList();
        model.addAttribute("reqDto", dtoList);
        model.addAttribute("isEmpty", dtoList.isEmpty());
    }

    @GetMapping("/write")
    public void reqWriteGet(){
        // TODO MemberDTO - 나중에 시큐리티에서 가져옴

    }


    @GetMapping("/detail/{conNo}")
    public String reqDetail(@PathVariable ("conNo")Integer conNO, Model model, ListDTO listDTO){
        model.addAttribute("reqDtoOne",requestService.getRequestOne(conNO));
        model.addAttribute("comDtoList", requestService.getCompanyList(listDTO, conNO));
//        TODO 조인 처리 해야 올바른 값이 나오나?? 이거 페이징 해줘야 할 것 같긴 한데
        return "/request/detail";

    }
    @GetMapping("/list/on/{reqId}")
    public void reqOn(@PathVariable ("reqId") Integer reqId){

    }



}