package com.osca.mapper;

import com.osca.domain.AttachFile;

public interface FileMapper {

    void fileInsert(AttachFile attachFile);

    void fileDelete(Integer qaNo);

    void fileInsertQaBoard(AttachFile attachFile);
}
