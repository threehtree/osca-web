package com.osca.service;

import com.osca.domain.AttachFile;
import com.osca.domain.QaBoard;
import com.osca.dto.ListDTO;
import com.osca.dto.ListResponseDTO;
import com.osca.dto.QaBoardDTO;
import com.osca.dto.UploadResultDTO;
import com.osca.mapper.FileMapper;
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
    private final FileMapper fileMapper;
    @Override
    public void qaUpdate(QaBoardDTO qaBoardDTO){
        //기존파일 모두 삭제
        fileMapper.fileDelete(qaBoardDTO.getQaNo());


        QaBoard qaBoard = QaBoard.builder()
                .qaTitle(qaBoardDTO.getQaTitle())
                .qaContent(qaBoardDTO.getQaContent())
                .qaNo(qaBoardDTO.getQaNo())
                .mainImage(qaBoardDTO.getMainImage())
                .build();
        qaBoardMapper.qaUpdate(qaBoard);

        for (UploadResultDTO uploadDTO : qaBoardDTO.getUploads()) {
            AttachFile attachFile = modelMapper.map(uploadDTO, AttachFile.class);
            attachFile.setQaNo(qaBoard.getQaNo());
            // 처음에 uploadresultDTO에 qano가 지정되지 않아 qano가 수집 이 안되서
            // attach File에 임의로 setter를 넣었다
            //todo check 현재 게시물 삭제 는 업뎃처리 + 첨부파일은 삭제가 필요하다 
            fileMapper.fileInsertQaBoard(attachFile);
        }// 여기까지 되야 업뎃 성공

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

        List<AttachFile> files =
                qaBoardDTO.getUploads().stream().map(uploadResultDTO -> modelMapper.map(uploadResultDTO,AttachFile.class)
                ).collect(Collectors.toList());


        log.info("=====================");
        log.info("=====================");
        log.info(qaBoard);
        log.info(files);
        qaBoardMapper.qaInsert(qaBoard);

        files.forEach(file -> fileMapper.fileInsert(file));
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
    public List<UploadResultDTO> getFiles(Integer qaNo) {

        List<AttachFile> attachFiles = qaBoardMapper.selectFiles(qaNo);


        return attachFiles.stream().map(attachFile -> modelMapper.map(attachFile, UploadResultDTO.class))
                .collect(Collectors.toList());
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
