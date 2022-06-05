package com.osca.mapper;

import com.osca.domain.AttachFile;
import com.osca.domain.QaBoard;
import com.osca.domain.Reply;
import com.osca.dto.ListDTO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface QaBoardMapper {

    void qaInsert(QaBoard qaBoard);

    void qaUpdate(QaBoard qaBoard);
    void qaDelete(Integer conNo);

    int qaGetTotal(ListDTO listDTO);


    List<QaBoard> getListOfQaBoard(ListDTO listDTO);
    QaBoard getOneOfQaBoard(QaBoard qaBoard);

    //댓글이 추가/삭제 되면 값이 바뀌어야지
    void updateReplyCount(@Param("qaNo") Integer qaNo,@Param("amount") int amount);

    //이미지 목록 요청
    List<AttachFile> selectFiles(Integer qaNo);

}
