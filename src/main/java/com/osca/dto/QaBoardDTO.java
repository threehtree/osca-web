package com.osca.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
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
    private int replyCount;

    private List<UploadResultDTO> uploads = new ArrayList<>();
    //메인이미지 섬네일
    private String mainImage;

    public String getMain(){
        if(mainImage == null){
            return null;
        }
        int idx = mainImage.indexOf("s_");
        String first = mainImage.substring(0,idx);//경로까지 컷.
        String second = mainImage.substring(idx+2);// s_ 제거

        return first+second;
    }
}
