package com.osca.service;

import com.osca.dto.ReplyDTO;
import lombok.extern.log4j.Log4j2;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

@Log4j2
@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/root-context.xml")

public class ReplyServiceTests {

    @Autowired
    private ReplyService replyService;

    @Test
    public void testInsert(){
        ReplyDTO replyDTO = new ReplyDTO();
        replyDTO.setQaNo(133);
        replyDTO.setReplyText("댓글 서비스 되냐");
        replyDTO.setReplyer("누군가의 유저");

        replyService.register(replyDTO);

    }

}

