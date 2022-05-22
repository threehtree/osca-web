package com.osca.service;

import com.osca.dto.CompanyDTO;
import com.osca.dto.ContractDTO;
import com.osca.dto.ListDTO;
import com.osca.dto.ListResponseDTO;

public interface RequestService {
    void reqInsert(ContractDTO contractDTO);
    ListResponseDTO<ContractDTO> getContractList(ListDTO listDTO, String memberId);
    ContractDTO getRequestOne(Integer conNo);
    //
    ListResponseDTO<CompanyDTO> getCompanyList(ListDTO listDTO, Integer conNo);



}