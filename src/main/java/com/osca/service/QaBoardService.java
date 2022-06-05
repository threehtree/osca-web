package com.osca.service;

import com.osca.domain.QaBoard;
import com.osca.dto.*;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional
public interface QaBoardService {

    void qaInsert(QaBoardDTO qaBoardDTO);
    void qaUpdate(QaBoardDTO qaBoardDTO);


    ListResponseDTO<QaBoardDTO> getListOfQaBoard(ListDTO listDTO);
    QaBoardDTO getOneOfQaBoard(QaBoardDTO qaBoardDTO);

//
    List<UploadResultDTO> getFiles(Integer qaNo);
    
}
