package com.osca.mapper;

import com.osca.domain.Reply;
import com.osca.dto.ListDTO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ReplyMapper {
//crud이지만 댓글은 종속되어있다.
    void insert(Reply reply);
    void delete(Integer qaNo);
    void update(Reply reply);
//총 댓글수
    int getTotal(ListDTO listDTO);


//??????????????
    Reply selectOne(Integer qaNo);

//    특정글에 댓글목록 
    List<Reply> selectListOfContract(@Param("qaNo") Integer qaNo, @Param("listDTO") ListDTO listDTO);
//  특정글의 총 댓글수
    int selectTotalOfBoard(Integer qaNo);
//    특정글의 댓글 한가지
    Reply selectOneReply(Integer rno);
//    특정글의 댓글 수정
    void updateReply(Reply reply);


}
