package com.osca.mapper;

import com.osca.domain.Contract;
import com.osca.dto.ListDTO;
import lombok.extern.log4j.Log4j2;
import org.apache.ibatis.jdbc.Null;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

@Log4j2
@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/root-context.xml")

public class RequestMapperTests {

    @Autowired(required = false)
    private RequestMapper requestMapper;

    @Test
    public void testReqInsert(){
        Contract contract = Contract.builder()
                .conName("sss")
                .conCategory("sss")
                .conLocation("dddd")
                .conSpace("ddddd")
                .conContent("content")
                .conRequest("Request")
                .build();

        requestMapper.reqInsert(contract);
    }
    @Test
    public void testReqCount(){

        requestMapper.getRequestTotal(new ListDTO());

    }
    @Test
    public void testCompanyOne(){
        int conNo = 84;
        requestMapper.selectCompanyOne(conNo);

    }

    @Test
    public void testContratUpdate(){

        Contract contract = Contract.builder()
                .conNo(60)
                .comId(null)
                .build();

        requestMapper.reqContract(contract);
    }
    @Test
    public void testReqUpdate(){
        Contract contract2 = Contract.builder()
                .conName("이제 되냐")
                .conNo(60)
                .comId(null)
                .build();
        requestMapper.reqUpdate(contract2);
    }
//
    @Test
    public void testReqCom(){
        Contract contract2 = Contract.builder()
                .conNo(61)
                .beforePrice("156165165")
                .comId("ㅋㅋㅋㅋㅋ")
                .build();
        requestMapper.reqUpdateComId(contract2);
    }
}
