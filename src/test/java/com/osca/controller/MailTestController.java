package com.osca.controller;

import lombok.extern.log4j.Log4j2;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;


import javax.mail.internet.MimeMessage;
import java.io.File;



@Log4j2
@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/root-context.xml")

public class MailTestController {

    @Autowired
    JavaMailSenderImpl mailSender;

    // MimeMessage 객체를 직접 생성하여 메일을 발송하는 방법
    @Test
    public void mailSendTest() throws Exception {


        String subject = "진짜 되는 메일이내";
        String content = "애요요요요요요요" + "<img src=\"https://bnetcmsus-a.akamaihd.net/cms/gallery/lc/LCM5AEMCWS2V1622683916493.png\">";
        String from = "ehdwnswjsdyd@gmail.com";
        String to = "ehdwnswjsdyd@naver.com";

        try {
            MimeMessage mail = mailSender.createMimeMessage();
            MimeMessageHelper mailHelper = new MimeMessageHelper(mail, true, "UTF-8");
            //MimeMessageHelper via a constructor that takes a 'multipart 문제시 멀티파트를 true로 바꾸면됨

            mailHelper.setFrom(from);
            mailHelper.setTo(to);
            mailHelper.setSubject(subject);
            mailHelper.setText(content, true);

            FileSystemResource file = new FileSystemResource(new File("C:\\123.txt"));
            mailHelper.addAttachment("123.txt", file);

            mailSender.send(mail);

        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}