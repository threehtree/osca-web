package com.osca.mapper;

import com.osca.domain.QaBoard;
import com.osca.domain.Reply;
import com.osca.dto.ListDTO;

import java.util.List;

public interface QaBoardMapper {

    void qaInsert(QaBoard qaBoard);

    void qaUpdate(QaBoard qaBoard);
    void qaDelete(Integer conNo);

    int qaGetTotal(ListDTO listDTO);


    List<QaBoard> getListOfQaBoard(ListDTO listDTO);
    QaBoard getOneOfQaBoard(QaBoard qaBoard);

}
