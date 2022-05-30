package com.osca.mapper;

import com.osca.domain.Reply;
import com.osca.dto.ListDTO;

import java.util.List;

public interface ReplyMapper {

    void insert(Reply reply);

    int getTotal(ListDTO listDTO);

    void delete(Integer conNo);

    Reply selectOne(Integer conNo);

    void update(Reply reply);

    List<Reply> selectListOfContract(Integer conNo);

}
