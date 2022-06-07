package com.osca.service;

import com.osca.dto.ListDTO;
import com.osca.dto.ListResponseDTO;
import com.osca.dto.NoticeBoardDTO;
import com.osca.dto.QaBoardDTO;

public interface NoticeBoardService {

    void noInsert(NoticeBoardDTO noticeBoardDTO);

    NoticeBoardDTO getOneNoticeBoard(NoticeBoardDTO noticeBoardDTO);

    ListResponseDTO<NoticeBoardDTO> getListOfNoticeBoard(ListDTO listDTO);

}
