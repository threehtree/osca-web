package com.osca.mapper;



import com.osca.domain.Auth;
import com.osca.dto.ListDTO;
import com.osca.domain.Member;
import org.apache.ibatis.annotations.Insert;

import java.util.List;

public interface MemberMapper {

    void memInsert(Member member);

    List<Member> selectMemberList(ListDTO listDTO);
    int getMemberTotal(ListDTO listDTO);
    void updateAsRemove(Integer reqno);

    List<Member> selectNoDeleteMemberList(ListDTO listDTO);
    Member selectMemberOne(Integer memNo);
    void memUpdate(Member member);


    void memRoleInsert(Member member);

    @Insert("insert into tbl_auth (memID,rolename) values (#{memID},#{rolename})")
    void addAuth(Auth auth);
    //동시에 처리해야하니까

    Member memSelectOne(String mid);



}
