package com.osca.mapper;

import com.osca.domain.Contract;
import com.osca.dto.ListDTO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface RequestMapper {
    void reqInsert(Contract contract);

    List<Contract> selectRequestList(@Param("listDTO") ListDTO listDTO, @Param("memberId") String memberId);

    int getRequestTotal(ListDTO listDTO);


}
