package com.osca.domain;

import lombok.*;

@Getter
@AllArgsConstructor
@NoArgsConstructor
@Builder
@ToString
public class AttachFile {

    private String uuid;
    private Integer qaNo;
    private String fileName;
    private String savepath;
    private boolean img;
}
