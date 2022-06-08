package com.osca.mapper;

import com.osca.domain.AttachFile;
import com.osca.domain.NoticeFile;

import java.util.List;

public interface NoticeFileMapper {
    void noFileInsert(NoticeFile noticeFile);

    void noFileDelete(Integer noNo);

    void noFileInsertQaBoard(NoticeFile noticeFile);


}
