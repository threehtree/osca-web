package com.osca.controller;

import com.osca.dto.*;
import com.osca.service.NoticeBoardService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@Log4j2
@RequiredArgsConstructor
@RequestMapping("/notice")
public class NoticeBoardController {
    private final NoticeBoardService noticeBoardService;


    @GetMapping("/list")
    public void noList(ListDTO listDTO, Model model){

        ListResponseDTO<NoticeBoardDTO> noticeBoardDTOListResponseDTO = noticeBoardService.getListOfNoticeBoard(listDTO);
        List<NoticeBoardDTO> dtoList = noticeBoardDTOListResponseDTO.getDtoList();

        model.addAttribute("noticeDTO", dtoList);
        model.addAttribute("pageMaker", new PageMaker(listDTO.getPage(), noticeBoardDTOListResponseDTO.getTotal()));


    }


    @GetMapping("/register")
    public void noRegisterGET(){

    }
    @PostMapping(value = "/register")
    public String  noRegisterPOST(NoticeBoardDTO noticeBoardDTO, RedirectAttributes rttr){

        noticeBoardService.noInsert(noticeBoardDTO);

        rttr.addFlashAttribute("result", 123);

        return "redirect:/notice/list";
    }

}
