package com.osca.service;

import com.osca.domain.Reply;
import com.osca.dto.ListDTO;
import com.osca.dto.QaBoardDTO;
import com.osca.dto.ReplyDTO;
import com.osca.mapper.QaBoardMapper;
import com.osca.mapper.ReplyMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
@Log4j2
public class ReplyServiceImpl implements ReplyService {

    private final ReplyMapper replyMapper;
    private final ModelMapper modelMapper;
    private final QaBoardMapper qaBoardMapper;

    @Override
    public List<ReplyDTO> getListOfContract(Integer qaNo, ListDTO listDTO) {

        List<Reply> replyList = replyMapper.selectListOfContract(qaNo, listDTO);

        List<ReplyDTO> dtoList = replyList.stream().map(reply -> modelMapper.map(reply, ReplyDTO.class))
                .collect(Collectors.toList());

        return dtoList;
    }

    @Override
    public int register(ReplyDTO replyDTO) {

        Reply reply= modelMapper.map(replyDTO, Reply.class);

        replyMapper.insert(reply); //댓글이 추가됫다. +1

        qaBoardMapper.updateReplyCount(replyDTO.getQaNo(), 1);

        return replyMapper.selectTotalOfBoard(replyDTO.getQaNo());
        //댓글을 추가한 후 페이징을 위해 다시한번 총 댓글수 반환
    }

}
