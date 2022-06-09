package com.osca.domain;

import lombok.*;

import java.time.LocalDate;
@Getter
@ToString
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class NoticeBoard {
    private Integer noNo;
    private String noWriter;
    private String noTitle;
    private String noContent;
    private String noFile;

    private LocalDate regDate;
    private int noDelFlag;

    //중요 공지사항 여부
    private boolean noticeRead;
}
