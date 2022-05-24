package com.osca.mapper;

import com.osca.domain.Company;
import com.osca.domain.Contract;
import com.osca.dto.ListDTO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface RequestMapper {
    void reqInsert(Contract contract);

    List<Contract> selectRequestList(@Param("listDTO") ListDTO listDTO, @Param("memberId") String memberId);

    int getRequestTotal(ListDTO listDTO);
    Contract getRequestOne(Integer conNo);
//
    Company selectCompanyOne(Integer conNo);
    int getCompanyTotal(ListDTO listDTO);

    void reqContract(Contract contract);
    void reqDelContract(Integer conNo);
    void reqUpdate(Contract contract);

}
