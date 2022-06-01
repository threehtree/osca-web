package com.osca.service;

import com.osca.domain.QaBoard;
import com.osca.dto.*;
import org.springframework.stereotype.Service;

import java.util.List;


public interface QaBoardService {

    void qaInsert(QaBoardDTO qaBoardDTO);
    void qaUpdate(QaBoardDTO qaBoardDTO);


    ListResponseDTO<QaBoardDTO> getListOfQaBoard(ListDTO listDTO);
    QaBoardDTO getOneOfQaBoard(QaBoardDTO qaBoardDTO);
    
}
