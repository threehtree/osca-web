package com.osca.mapper;

import com.osca.domain.Company;
import com.osca.domain.Contract;
import com.osca.dto.ListDTO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface RequestMapper {

//    의뢰

    //의뢰 등록
    void reqInsert(Contract contract);
    //간소화된 계약 업데이트
    void reqUpdate(Contract contract);
    //업데이트를 통한 삭제 처리
    void reqDelContract(Integer conNo);

    //특정 의뢰 뽑기
    Contract getRequestOne(Integer conNo);
    //총 의뢰 글 개수 [순수 값이라 서비스기능 안거침]
    int getRequestTotal(ListDTO listDTO);


//회원

    //회원의 의뢰 +계약 목록
    List<Contract> reqMemList(@Param("listDTO") ListDTO listDTO, @Param("memberId") String memberId);


//시공사

    //계약번호로 특정 시공사 조회 [아직 시공사에 conNo준 곳이 없음]
    //입찰목록 인원 뽑을때
    Company selectCompanyOne(Integer conNo);
    //아이디로 특정 시공사 조회
    //입찰 시공사 상세내용 뽑을때
    Company selectReqCom(String comId);
    //시공사 총 작성글[순수 값이라 서비스기능 안거침]
    int getCompanyTotal(ListDTO listDTO);


// 계약 권한 상태
    void reqUpdateComId(Contract contract);
    void reqContract(Contract contract);
    void reqUpdateContract(Contract contract);
    void reqUpdateContracting(Contract contract);
    void reqUpdateBuild(Contract contract);
    void reqUpdateBuildComplete(Contract contract);

}
