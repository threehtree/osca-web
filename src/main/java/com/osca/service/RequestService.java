package com.osca.service;

import com.osca.domain.Contract;
import com.osca.dto.CompanyDTO;
import com.osca.dto.ContractDTO;
import com.osca.dto.ListDTO;
import com.osca.dto.ListResponseDTO;

public interface RequestService {
    void reqInsert(ContractDTO contractDTO);
    ListResponseDTO<ContractDTO> getContractList(ListDTO listDTO, String memberId);
    ContractDTO getRequestOne(Integer conNo);
    CompanyDTO selectCompanyOne(Integer conNo);
    void reqContract(ContractDTO contractDTO);
    void reqDelContract(Integer conNo);
    void reqUpdate(ContractDTO contractDTO);
    void reqUpdateComId(ContractDTO contractDTO);
    CompanyDTO selectReqCom(String comId);
    void reqUpdateContract(ContractDTO contractDTO);

}
