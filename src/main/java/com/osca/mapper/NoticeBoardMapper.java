package com.osca.mapper;

import com.osca.domain.NoticeBoard;
import com.osca.domain.NoticeFile;
import com.osca.domain.QaBoard;
import com.osca.dto.ListDTO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface NoticeBoardMapper {
    void noInsert(NoticeBoard noticeBoard);
    NoticeBoard getOneOfNoticeBoard(NoticeBoard noticeBoard);
    void noUpdate(NoticeBoard noticeBoard);
    void noDelUpdate(NoticeBoard noticeBoard);

    List<NoticeBoard> getListOfNoticeBoard(ListDTO listDTO);
    int noticeGetTotal(ListDTO listDTO);

    //파일목록 가져오기
    List<NoticeFile> selectNoFiles(Integer noNO);

    void noViewsUp(@Param("noNO") Integer noNO, @Param("views") Integer views);

}
