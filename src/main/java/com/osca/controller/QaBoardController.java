package com.osca.controller;


import com.osca.dto.ListDTO;
import com.osca.dto.ListResponseDTO;
import com.osca.dto.PageMaker;
import com.osca.dto.QaBoardDTO;
import com.osca.service.QaBoardService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@Log4j2
@RequiredArgsConstructor
@RequestMapping("/qa")
public class QaBoardController {
    private final QaBoardService qaBoardService;

    @PostMapping("/modify")
    public String qaModifyPOST( QaBoardDTO qaBoardDTO){
        qaBoardService.qaUpdate(qaBoardDTO);

        return "redirect:/qa/read/"+qaBoardDTO.getQaNo();
    }

    @GetMapping("/modify")
    public void qaModify(QaBoardDTO qaBoardDTO, Model model){
        QaBoardDTO dtoOne =qaBoardService.getOneOfQaBoard(qaBoardDTO);
        model.addAttribute("qaDTO", dtoOne);
//        return "/qa/modify";
    }

    @GetMapping("/read/{qaNo}")
    public String getOneOfQaBoard(@PathVariable ("qaNo") Integer qaNo, QaBoardDTO qaBoardDTO, Model model){
    QaBoardDTO dtoOne =qaBoardService.getOneOfQaBoard(qaBoardDTO);
        model.addAttribute("qaDTO", dtoOne);
    return "/qa/read";
    }

    @GetMapping("/list")
    public void qaList(ListDTO listDTO,Model model){

        ListResponseDTO<QaBoardDTO> qaBoardDTOListResponseDTO = qaBoardService.getListOfQaBoard(listDTO);
        List<QaBoardDTO> dtoList = qaBoardDTOListResponseDTO.getDtoList();

        model.addAttribute("qaDTO", dtoList);
        model.addAttribute("isEmpty", dtoList.isEmpty());
        model.addAttribute("pageMaker",new PageMaker(listDTO.getPage(), qaBoardDTOListResponseDTO.getTotal()));

    }
    @GetMapping("/register")
    public void qaRegister(){

    }
    @PostMapping("/register")
    public String  qaRegisterPOST(QaBoardDTO qaBoardDTO){
        qaBoardService.qaInsert(qaBoardDTO);

        return "redirect:/qa/list";
    }
}
