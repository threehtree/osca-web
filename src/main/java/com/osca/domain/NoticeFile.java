package com.osca.domain;


import lombok.*;

@Getter
@AllArgsConstructor
@NoArgsConstructor
@Builder
@ToString
public class NoticeFile {

    private String uuid;
    private Integer noNo;
    private String fileName;
    private String savepath;
    private boolean img;

    public void setNoNo(Integer noNo){
        this.noNo = noNo;
    }

}
