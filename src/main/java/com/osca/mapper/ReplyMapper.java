package com.osca.mapper;

import com.osca.domain.Reply;
import com.osca.dto.ListDTO;

import java.util.List;

public interface ReplyMapper {
//crud이지만 댓글은 종속되어있다.
    void insert(Reply reply);
    void delete(Integer qaNo);
    void update(Reply reply);
//총 댓글수
    int getTotal(ListDTO listDTO);


//??????????????
    Reply selectOne(Integer conNo);

//    특정글에 댓글목록 
    List<Reply> selectListOfContract(Integer conNo);




}
