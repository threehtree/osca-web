package com.osca.service;

import com.osca.dto.*;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional
public interface NoticeBoardService {

    void noInsert(NoticeBoardDTO noticeBoardDTO);

    NoticeBoardDTO getOneNoticeBoard(NoticeBoardDTO noticeBoardDTO);

    void noUpdate(NoticeBoardDTO noticeBoardDTO);

    void noDelUpdate(NoticeBoardDTO noticeBoardDTO);


    List<UploadResultDTO> getNoFiles(Integer noNo);

    ListResponseDTO<NoticeBoardDTO> getListOfNoticeBoard(ListDTO listDTO);

}
