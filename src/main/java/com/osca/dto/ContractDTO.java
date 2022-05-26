package com.osca.dto;

import lombok.Data;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Data
public class ContractDTO {
    private Integer conNo;
    private String conName;
    private String conCategory;
    private String conLocation;
    private String conSpace;
    private String conContent;
    private String conRequest;
    private int conCondition;
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
    private String beforePrice;


}
