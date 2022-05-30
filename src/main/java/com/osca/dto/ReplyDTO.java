package com.osca.dto;

import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDateTime;

@Data
public class ReplyDTO {

    private Integer rno;
    private Integer bno;
    private String replyText;
    private String replyer;

    @DateTimeFormat(pattern = "yyyy-MM-dd kk:mm:ss")
    //todo 30 이거 원래 오류떠야하는데 위의     @DateTimeFormat(pattern = "yyyy-MM-dd kk:mm:ss")  없이도 잘나오네
    //라이브러리에 넣어둔게 뭐가 처리햇나봐 
    private LocalDateTime regDate;
    @DateTimeFormat(pattern = "yyyy-MM-dd kk:mm:ss")
    private LocalDateTime updateDate;
    //여기서 @Builder가 없는건 어차피 Contract종속이라 Contract가 파라메터 수집할때 잇는 내용 쓰면 그만임


}
