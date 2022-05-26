package com.osca.service;

import com.osca.domain.Member;
import com.osca.dto.MemberDTO;
import com.osca.mapper.MemberMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
@Log4j2

public class MemberServiceImpl implements MemberService{
    private final MemberMapper memberMapper;


    @Override
    public void memInsert(MemberDTO memberDTO) {

        Member member = Member.builder()
                .memID(memberDTO.getMemID())
                .memName(memberDTO.getMemName())
                .memEmail(memberDTO.getMemEmail())
                .build();

        memberMapper.memInsert(member);

    }
}
