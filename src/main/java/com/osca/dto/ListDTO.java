package com.osca.dto;

import lombok.Getter;
import lombok.ToString;
import org.springframework.web.util.UriComponentsBuilder;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

@ToString
@Getter
public class ListDTO {

    private int page;
    private int size;

    private String link;

    //t tc tcw
    private String type;
    private String keyword;

    public ListDTO() {
        this.page = 1;
        this.size = 10;
    }

    public void setType(String type) {
        this.type = type;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

    //아래 코드로 할 시 검색 조건이 걸려야만 페이지 넘어감
//    public String[] getTypes(){
//        if (type==null){
//            return new String[]{};
//        }
//        return type.split("");
//    }

    public String[] getTypes(){
        if(type == null || type.trim().length() == 0){
            return new String[]{};
        }
        return type.split("");
    }

    public String getKeyword(){

        return keyword ==null  || keyword.trim().length() == 0 ? null: keyword.trim();
    }

    public void setPage(int page) {
        this.page = page <= 0? 1: page;
    }


    public void setSize(int size) {
        // 다중 상함 효력은 좋으나 가독성 나쁨
        //        this.size = size <10 ? 10 : size >= 1000 ? 10 : size;
        this.size = size < 10? 10: size;
    }

    public int getSkip(){
        return (this.page - 1) * size;
    }

    public String getLink(){

        UriComponentsBuilder builder = UriComponentsBuilder.newInstance();
        builder.queryParam("page", getPage())
                .queryParam("size", getSize());

        if(type != null){
            builder.queryParam("type", type);
        }
        if (keyword !=null){
//            try {
//                String enStr = URLEncoder.encode("세종 대왕 만세","UTF-8");
//                builder.queryParam("keyword", enStr);
//            }catch (UnsupportedEncodingException e){
//                e.printStackTrace();
//            }

            try {
                String enStr = URLEncoder.encode(keyword, "UTF-8");
                builder.queryParam("keyword", enStr);
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }

        }
        return builder.build().toString();
    }
}
