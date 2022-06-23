package com.osca.mapper;


import com.osca.domain.Auth;
import com.osca.domain.Member;
import lombok.extern.log4j.Log4j2;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

@Log4j2
@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/root-context.xml")

public class MemberMapperTests {
    @Autowired(required = false)
    private MemberMapper mapper;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Test
    public void testInsert(){
        for (int i = 0; i < 30; i++) {
            Member member = Member.builder()
                    .memID("Auser"+i)
                    .memPW(passwordEncoder.encode("1111"))
                    .memName("닉닉네임")
                    .build();
            mapper.memRoleInsert(member);
            if(i >  10 ){
                Auth auth = Auth.builder().memID("Auser"+i).rolename("ADMIN").build();
                mapper.addAuth(auth);

            }
            Auth auth = Auth.builder().memID("Auser"+i).rolename("MEMBER").build();
            mapper.addAuth(auth);


        }

    }

    @Test
    public void testSelectOne(){
        String memID = "Auser10";
        Member member = mapper.memSelectOne(memID);
        log.info("=======================================");
        log.info(member);

    }

}
