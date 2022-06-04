package com.osca.service;

import com.osca.dto.ListDTO;
import com.osca.dto.QaBoardDTO;
import com.osca.dto.ReplyDTO;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


@Transactional
public interface ReplyService {

    List<ReplyDTO>  getListOfContract(Integer qaNo, ListDTO listDTO);

    int register(ReplyDTO replyDTO);

    ReplyDTO selectOneReply(Integer rno);

}
