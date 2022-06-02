package com.osca.aop;

import lombok.extern.log4j.Log4j2;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

import java.util.Arrays;

@Aspect//컴포넌트 스캔 필요, 그래야 스프링이 aop로 인식
@Log4j2
@Component// 해줘야 bean으로 인식

public class LogAdvice {

    @Before("execution(* com.osca.service.*.*(..))") //이러면 service패키지에 해당하는거 실행하면 다 로그가 뜸[조인포인트 문법]
    public void printLog(JoinPoint joinPoint){
        Object[] params = joinPoint.getArgs();//조인포인트를 기준으로 메소드에 전달되는 파라메터를 알수 잇음

        log.info("------------------------");
        log.info("------------------------");
        log.info(Arrays.toString(params)); //이걸 쓰면 서비스 단부터 가져오는 파라메터 다 확인 됨 ! 개꿀기능
        log.info("------------------------");
        log.info("------------------------");


    }
}
