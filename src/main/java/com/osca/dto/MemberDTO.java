package com.osca.dto;

import lombok.Data;

import java.time.LocalDate;

@Data
public class MemberDTO {
    private Integer memNo;
    private String memID;
    private String memPW;
    private String memName;
    private String memPhone;
    private String memEmail;
    private String memProfile;
    private String memBirth;
    private String memAddress;

    private LocalDate regDate;
    private LocalDate updateDate;
    private int delFlag ;

    
}
