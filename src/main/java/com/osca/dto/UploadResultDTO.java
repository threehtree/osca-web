package com.osca.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class UploadResultDTO {
    private String uuid;
    private String fileName;
    private String savePath;
    private boolean img;
    //이것들을 받아야 DB에 넣지 , 파일은 원래 로컬에 넣음
    public String getLink(){
        return savePath+"/"+uuid+"_"+fileName;
    }
    public String getThumbnail(){
        return savePath+"/s_"+uuid+"_"+fileName;
    }
    //jasonDataBiniding이 get이 있으면 프로퍼티로 보고 가져와준데

}
