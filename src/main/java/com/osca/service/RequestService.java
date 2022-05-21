package com.osca.service;

import com.osca.dto.ContractDTO;
import com.osca.dto.ListDTO;
import com.osca.dto.ListResponseDTO;

public interface RequestService {
    void reqInsert(ContractDTO contractDTO);
    ListResponseDTO<ContractDTO> getContractList(ListDTO listDTO, String memberId);



}
