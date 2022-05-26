package com.osca.mapper;



import com.osca.dto.ListDTO;
import com.osca.domain.Member;

import java.util.List;

public interface MemberMapper {

    void memInsert(Member member);

    List<Member> selectMemberList(ListDTO listDTO);
    int getMemberTotal(ListDTO listDTO);
    void updateAsRemove(Integer reqno);

    List<Member> selectNoDeleteMemberList(ListDTO listDTO);
    Member selectMemberOne(Integer memNo);
    void memUpdate(Member member);


}
