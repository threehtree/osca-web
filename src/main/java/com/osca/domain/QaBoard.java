package com.osca.domain;

import lombok.*;

import java.time.LocalDate;
import java.time.LocalDateTime;

@Getter
@ToString
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class QaBoard {
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
    private int replyCount;
    private String mainImage;
 }
