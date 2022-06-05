package com.osca.service;

import com.osca.domain.AttachFile;
import com.osca.domain.QaBoard;
import com.osca.dto.ListDTO;
import com.osca.dto.ListResponseDTO;
import com.osca.dto.QaBoardDTO;
import com.osca.mapper.QaBoardMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;


@Service
@RequiredArgsConstructor
@Log4j2
public class QaBoardServiceImpl implements QaBoardService {
    private final QaBoardMapper qaBoardMapper;
    private final ModelMapper modelMapper;

    @Override
    public void qaUpdate(QaBoardDTO qaBoardDTO){
        QaBoard qaBoard = QaBoard.builder()
                .qaTitle(qaBoardDTO.getQaTitle())
                .qaContent(qaBoardDTO.getQaContent())
                .build();
        qaBoardMapper.qaUpdate(qaBoard);

    }

    @Override
    public void qaInsert(QaBoardDTO qaBoardDTO) {

//        QaBoard qaBoard = QaBoard.builder()
//                .qaWriter(qaBoardDTO.getQaWriter())
//                .qaTitle(qaBoardDTO.getQaTitle())
//                .qaContent(qaBoardDTO.getQaContent())
//                .build();

        QaBoard qaBoard = modelMapper.map(qaBoardDTO, QaBoard.class);
//        qaBoardMapper.qaInsert(qaBoard);

        log.info("=====================");
        log.info("=====================");
        log.info(qaBoard);
        log.info("=====================");
        log.info("=====================");

    }

    @Override
    public QaBoardDTO getOneOfQaBoard(QaBoardDTO qaBoardDTO) {
        QaBoard qaBoard = QaBoard.builder()
                .qaNo(qaBoardDTO.getQaNo())
                .build();
        qaBoardMapper.getOneOfQaBoard(qaBoard);
       QaBoardDTO qaBoardDTO1 = modelMapper.map( qaBoardMapper.getOneOfQaBoard(qaBoard),QaBoardDTO.class);

        return qaBoardDTO1;
    }


    @Override
    public ListResponseDTO<QaBoardDTO> getListOfQaBoard(ListDTO listDTO) {

        List<QaBoard> qaBoardList = qaBoardMapper.getListOfQaBoard(listDTO);

        List<QaBoardDTO> dtoList =
                qaBoardList.stream().map(qaBoard -> modelMapper.map(qaBoard, QaBoardDTO.class))
                        .collect(Collectors.toList());


        return ListResponseDTO.<QaBoardDTO>builder()
                .dtoList(dtoList)
                .total(qaBoardMapper.qaGetTotal(listDTO))
                .build();
    }


}
