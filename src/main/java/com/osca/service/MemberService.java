package com.osca.service;

import com.osca.domain.Member;
import com.osca.dto.MemberDTO;

public interface MemberService {
    void memInsert(MemberDTO memberDTO);
    void memRoleInsert(MemberDTO memberDTO);

}
