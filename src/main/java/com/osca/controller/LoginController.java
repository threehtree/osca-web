package com.osca.controller;

import com.osca.dto.*;
import com.osca.service.MemberService;
import com.osca.service.RequestService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.Arrays;
import java.util.List;

@Controller
@Log4j2
@RequiredArgsConstructor
@RequestMapping("/")
public class LoginController {
    private final RequestService requestService;
    private final MemberService memberService;

    @GetMapping("/")
    public String login(){
        return "login";
    }

    @GetMapping("/register")
    public void register(){


    }



    @PostMapping("/register")
    public String registerPOST(ContractDTO contractDTO){
        String memid = "123";
        contractDTO.setMemId(memid);
        requestService.reqInsert(contractDTO);
        return "redirect:/list";


    }


    @GetMapping("/list")
    public void contractList(ListDTO listDTO, Model model){
        // MemberDTO - 나중에 시큐리티에서 가져옴
        String memberId = "123"; // TODO 구글 로그인에서 받아온 이메일로 멤버테이블에서 멤버DTO를 가져오고 그 멤버 DTO에서 멤버ID를가져옴
        ListResponseDTO<ContractDTO> contractDTOListResponseDTO = requestService.reqMemList(listDTO, memberId);
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
    public String contractModifyPost(@PathVariable("conNo") Integer conNo,ContractDTO contractDTO){

        requestService.reqUpdate(contractDTO);

        return "redirect:/read/"+conNo;
    }

    @GetMapping("/mypage")
    public void memMypage(){

    }
//    @PostMapping("/delete")
//    public String memConDel(Integer conNo, RedirectAttributes rttr){
//        requestService.reqDelContract(conNo);
//        rttr.addFlashAttribute("result", "delMemCon");
//        return "redirect:/list";
//    }
    //현재 uploadController와 경로 겹쳐서 막음음
    @GetMapping("/memRegister")
    public void memRegister(){

    }

    @PostMapping("/memberSignUp")
    public String memberRegister(MemberDTO memberDTO, RedirectAttributes rttr){
        log.info("=============================");
        log.info(memberDTO);

        memberService.memInsert(memberDTO);

        rttr.addFlashAttribute("result", 111);
        //값이 잘 전달 됫는지 확인용

        return "redirect:/list";
    }

    @PostMapping("/companySignUp")
    public String companyRegister(@RequestBody Object body){
        return "redirect:/list";
    }
}
