package com.osca.domain;

import lombok.*;

import java.time.LocalDate;

@Getter
@ToString
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Contract {

    private Integer conNo;
    private String conName;
    private String conCategory;
    private String conLocation;
    private String conSpace;
    private String conContent;
    private String conRequest;
    private String conCondition;
    private String conStartDay;
    private String conEndDay;
    private String conPrice;
    private String conDocument;
    private String conImg;
    private String memId;
    private String comId;
    private String comState;

    private LocalDate regDate;
    private LocalDate updateDate;
    private int delFlag;
}
