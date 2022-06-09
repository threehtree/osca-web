package com.osca.mapper;

import com.osca.domain.NoticeBoard;
import com.osca.domain.NoticeFile;
import com.osca.domain.QaBoard;
import com.osca.dto.ListDTO;

import java.util.List;

public interface NoticeBoardMapper {
    void noInsert(NoticeBoard noticeBoard);
    NoticeBoard getOneOfNoticeBoard(NoticeBoard noticeBoard);
    void noUpdate(NoticeBoard noticeBoard);

    List<NoticeBoard> getListOfNoticeBoard(ListDTO listDTO);
    int noticeGetTotal(ListDTO listDTO);

    //파일목록 가져오기
    List<NoticeFile> selectNoFiles(Integer noNO);

}
