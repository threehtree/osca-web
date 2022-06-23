package com.osca.service;

import com.osca.domain.Auth;
import com.osca.domain.Member;
import com.osca.dto.MemberDTO;
import com.osca.mapper.MemberMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
@Log4j2

public class MemberServiceImpl implements MemberService{
    private final MemberMapper memberMapper;
    private final PasswordEncoder passwordEncoder;


    @Override
    public void memInsert(MemberDTO memberDTO) {

        Member member = Member.builder()
                .memID(memberDTO.getMemID())
                .memName(memberDTO.getMemName())
                .memEmail(memberDTO.getMemEmail())
                .build();

        memberMapper.memInsert(member);

    }

    @Override
    public void memRoleInsert(MemberDTO memberDTO) {
        Member member = Member.builder()
                .memID(memberDTO.getMemID())
                .memPW(passwordEncoder.encode(memberDTO.getMemPW()))
                .memName(memberDTO.getMemName())
                .memEmail(memberDTO.getMemEmail())
                .build();
        memberMapper.memRoleInsert(member);

        Auth auth = Auth.builder()
                .memID(memberDTO.getMemID())
                .rolename("MEMBER")
                .build();
        memberMapper.addAuth(auth);

    }
}
