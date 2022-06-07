package com.osca.service;


import com.osca.domain.NoticeBoard;
import com.osca.domain.QaBoard;
import com.osca.dto.ListDTO;
import com.osca.dto.ListResponseDTO;
import com.osca.dto.NoticeBoardDTO;
import com.osca.dto.QaBoardDTO;
import com.osca.mapper.NoticeBoardMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
@Log4j2
@RequiredArgsConstructor
public class NoticeBoardServiceImpl implements NoticeBoardService{
    private final NoticeBoardMapper noticeBoardMapper;
    private final ModelMapper modelMapper;


    @Override
    public void noInsert(NoticeBoardDTO noticeBoardDTO) {

        NoticeBoard noticeBoard = modelMapper.map(noticeBoardDTO , NoticeBoard.class);
        noticeBoardMapper.noInsert(noticeBoard);

    }

    @Override
    public ListResponseDTO<NoticeBoardDTO> getListOfNoticeBoard(ListDTO listDTO) {

        List<NoticeBoard> noticeBoardList = noticeBoardMapper.getListOfNoticeBoard(listDTO);

        List<NoticeBoardDTO> dtoList =
                noticeBoardList.stream().map(noticeBoard -> modelMapper.map(noticeBoard, NoticeBoardDTO.class))
                        .collect(Collectors.toList());


        return ListResponseDTO.<NoticeBoardDTO>builder()
                .dtoList(dtoList)
                .total(noticeBoardMapper.noticeGetTotal(listDTO))
                .build();
    }

}
