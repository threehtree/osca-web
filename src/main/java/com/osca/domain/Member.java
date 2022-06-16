package com.osca.domain;

import lombok.*;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Getter
@ToString
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Member {
    private Integer memNo;
    private String memID; //ID가 Id로 되어있네요 하나로 통일하죠
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

    @Builder.Default
    private List<Auth> authList = new ArrayList<>();



}
