package com.osca.service;


import com.osca.domain.AttachFile;
import com.osca.domain.NoticeBoard;
import com.osca.domain.NoticeFile;
import com.osca.domain.QaBoard;
import com.osca.dto.*;
import com.osca.mapper.NoticeBoardMapper;
import com.osca.mapper.NoticeFileMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;

@Service
@Log4j2
@RequiredArgsConstructor
public class NoticeBoardServiceImpl implements NoticeBoardService{
    private final NoticeBoardMapper noticeBoardMapper;
    private final ModelMapper modelMapper;
    private final NoticeFileMapper noticeFileMapper;


    @Override
    public void noInsert(NoticeBoardDTO noticeBoardDTO) {

        NoticeBoard noticeBoard = modelMapper.map(noticeBoardDTO , NoticeBoard.class);

        List<NoticeFile> files =
                noticeBoardDTO.getUploads().stream().map(uploadResultDTO -> modelMapper.map(uploadResultDTO,NoticeFile.class)
                ).collect(Collectors.toList());

        noticeBoardMapper.noInsert(noticeBoard);
        files.forEach(file -> noticeFileMapper.noFileInsert(file));

    }

    @Override
    public NoticeBoardDTO getOneNoticeBoard(NoticeBoardDTO noticeBoardDTO) {
        NoticeBoard noticeBoard = modelMapper.map(noticeBoardDTO, NoticeBoard.class);
        NoticeBoard oneOfNoticeBoard = noticeBoardMapper.getOneOfNoticeBoard(noticeBoard);
        NoticeBoardDTO noticeBoardDTO1 = modelMapper.map(oneOfNoticeBoard, NoticeBoardDTO.class);

        return noticeBoardDTO1;
    }




    @Override
    public void noUpdate(NoticeBoardDTO noticeBoardDTO) {
        noticeFileMapper.noFileDelete(noticeBoardDTO.getNoNo());

        NoticeBoard noticeBoard = modelMapper.map(noticeBoardDTO, NoticeBoard.class);

        noticeBoardMapper.noUpdate(noticeBoard);


        for (UploadResultDTO uploadDTO: noticeBoardDTO.getUploads()){
            NoticeFile noticeFile = modelMapper.map(uploadDTO, NoticeFile.class);
            noticeFile.setNoNo(noticeBoard.getNoNo());
            noticeFileMapper.noFileInsertNoticeBoard(noticeFile);

        }


    }





    @Override
    public List<UploadResultDTO> getNoFiles(Integer noNo) {

        List<NoticeFile> noticeFiles = noticeBoardMapper.selectNoFiles(noNo);


        return noticeFiles.stream().map(noticeFile -> modelMapper.map(noticeFile, UploadResultDTO.class))
                .collect(Collectors.toList());
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
