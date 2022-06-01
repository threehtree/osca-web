package com.osca.dto;

import lombok.Data;

import java.time.LocalDate;
import java.time.LocalDateTime;

@Data
public class QaBoardDTO {
    private Integer qaNo;
    private String qaWriter;
    private String qaTitle;
    private String qaContent;
    private String qaFile;
    private String qaAnswer;


    private int qaAnswerFlag;
    private String qaReply;
    private LocalDate regDate;
    private int qaDelFlag;

}
