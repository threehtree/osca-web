package com.osca.controller;

import com.osca.domain.Contract;
import com.osca.dto.*;
import com.osca.service.RequestService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@Log4j2
@RequiredArgsConstructor
@RequestMapping("/request")
public class RequestController {
    private final RequestService requestService;


    @GetMapping("/list")
    public void reqMemList(ListDTO listDTO, Model model){
        // MemberDTO - 나중에 시큐리티에서 가져옴
        String memberId = "123"; // TODO 구글 로그인에서 받아온 이메일로 멤버테이블에서 멤버DTO를 가져오고 그 멤버 DTO에서 멤버ID를가져옴
        ListResponseDTO<ContractDTO> contractDTOListResponseDTO = requestService.reqMemList(listDTO, memberId);
        List<ContractDTO> dtoList = contractDTOListResponseDTO.getDtoList();
        model.addAttribute("reqDto", dtoList);
        model.addAttribute("isEmpty", dtoList.isEmpty());
        model.addAttribute("pageMaker",new PageMaker(listDTO.getPage(), contractDTOListResponseDTO.getTotal()));

    }

    @GetMapping("/write")
    public void reqWriteGet(){
        // TODO MemberDTO - 나중에 시큐리티에서 가져옴

    }


    @GetMapping("/detail/{conNo}")
    public String reqDetail(@PathVariable ("conNo")Integer conNo, Model model){

//        String asd = requestService.getRequestOne(conNo).getComId();
//        boolean ch = asd.isEmpty();

//        if(!CompanyDTO companyDTO =requestService.getRequestOne(conNo).getComId().isEmpty()) {
        ContractDTO requestOne = requestService.getRequestOne(conNo);
        String reqComId = requestOne.getComId();

        if(requestOne.getComId() != null){
//        todo getRequestOne 으로 조회했을때 comId가 null이면  if문처리 어때?
        CompanyDTO companyDTO = requestService.selectReqCom(reqComId);
            if(companyDTO != null) {
                model.addAttribute("comDTOOne", companyDTO);
            } //
        }

        model.addAttribute("reqDtoOne", requestOne);

//        model.addAttribute("pageMaker", new PageMaker(listDTO.getPage(),companyTotal));
//        TODO 조인 처리 해야 올바른 값이 나오나?? 이거 페이징 해줘야 할 것 같긴 한데
        return "/request/detail";

    }
    @GetMapping("/list/on/{reqId}")
    public void reqOn(@PathVariable ("reqId") Integer reqId){

    }
    @GetMapping("/modify")
    public String reqModifyGet(Integer conNo, Model model){

        ContractDTO requestOne = requestService.getRequestOne(conNo);

        model.addAttribute("reqDtoOne", requestOne);

//        model.addAttribute("pageMaker", new PageMaker(listDTO.getPage(),companyTotal));
//        TODO 조인 처리 해야 올바른 값이 나오나?? 이거 페이징 해줘야 할 것 같긴 한데
        return "/request/modify";

    }


}
