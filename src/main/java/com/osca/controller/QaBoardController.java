package com.osca.controller;


import com.osca.domain.AttachFile;
import com.osca.domain.QaBoard;
import com.osca.dto.*;
import com.osca.service.QaBoardService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.http.MediaType;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.Arrays;
import java.util.List;

@Controller
@Log4j2
@RequiredArgsConstructor
@RequestMapping("/qa")
public class QaBoardController {
    private final QaBoardService qaBoardService;

    @PreAuthorize("isAuthenticated()") //로그인함?
    @PostMapping("/modify/{qaNo}")
    public String qaModifyPOST(@PathVariable("qaNo") Integer qaNo, QaBoardDTO qaBoardDTO){
        qaBoardDTO.setQaNo(qaNo);
        qaBoardService.qaUpdate(qaBoardDTO);

        return "redirect:/qa/read/"+qaBoardDTO.getQaNo();
    }
    @PreAuthorize("isAuthenticated()") //로그인함?
    @GetMapping("/modify/{qaNo}")
    public String qaModify(@PathVariable("qaNo") Integer qaNo,  QaBoardDTO qaBoardDTO, Model model){
        QaBoardDTO dtoOne =qaBoardService.getOneOfQaBoard(qaBoardDTO);
        model.addAttribute("qaDTO", dtoOne);
        return "/qa/modify";
    }
    @PreAuthorize("isAuthenticated()") //로그인함?
    @GetMapping("/read/{qaNo}")
    public String getOneOfQaBoard(@PathVariable ("qaNo") Integer qaNo, QaBoardDTO qaBoardDTO, Model model){
    QaBoardDTO dtoOne =qaBoardService.getOneOfQaBoard(qaBoardDTO);
//        dtoOne.setUploads(qaBoardService.getFiles(qaNo));

        model.addAttribute("qaDTO", dtoOne);
       
    return "/qa/read";
    }
    @PreAuthorize("isAuthenticated()") //로그인함?
    @GetMapping("/list")
    public void qaList(ListDTO listDTO,Model model){

        ListResponseDTO<QaBoardDTO> qaBoardDTOListResponseDTO = qaBoardService.getListOfQaBoard(listDTO);
        List<QaBoardDTO> dtoList = qaBoardDTOListResponseDTO.getDtoList();

        model.addAttribute("qaDTO", dtoList);
        model.addAttribute("isEmpty", dtoList.isEmpty());
        model.addAttribute("pageMaker",new PageMaker(listDTO.getPage(), qaBoardDTOListResponseDTO.getTotal()));

    }
    @PreAuthorize("isAuthenticated()") //로그인함?
    @GetMapping("/register")
    public void qaRegister(){

    }
    @PreAuthorize("isAuthenticated()") //로그인함?
    @PostMapping(value = "/register")
    public String  qaRegisterPOST(QaBoardDTO qaBoardDTO, RedirectAttributes rttr){

        qaBoardService.qaInsert(qaBoardDTO);
        rttr.addFlashAttribute("result", 123);

        return "redirect:/qa/list";
    }
    @GetMapping("/files/{qaNo}")
    @ResponseBody
    public List<UploadResultDTO> getFiles (@PathVariable("qaNo") Integer qaNo){
        return qaBoardService.getFiles(qaNo);
    }

}
