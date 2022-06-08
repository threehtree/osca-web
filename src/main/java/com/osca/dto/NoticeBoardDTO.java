package com.osca.dto;

import lombok.Data;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Data
public class NoticeBoardDTO {

        private Integer noNo;
        private String noWriter;
        private String noTitle;
        private String noContent;
        private String noFile;

        private LocalDate regDate;
        private int noDelFlag;

        //중요 공지사항 여부
        private boolean strong;

        private List<UploadResultDTO> uploads = new ArrayList<>();
}
