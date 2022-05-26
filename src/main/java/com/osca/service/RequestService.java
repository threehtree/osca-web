package com.osca.service;

import com.osca.domain.Contract;
import com.osca.dto.CompanyDTO;
import com.osca.dto.ContractDTO;
import com.osca.dto.ListDTO;
import com.osca.dto.ListResponseDTO;

public interface RequestService {
//    의뢰
    void reqInsert(ContractDTO contractDTO);
    void reqUpdate(ContractDTO contractDTO);
    void reqDelContract(Integer conNo);

    ContractDTO getRequestOne(Integer conNo);

//    회원
    ListResponseDTO<ContractDTO> reqMemList(ListDTO listDTO, String memberId);

//    시공사
    CompanyDTO selectCompanyOne(Integer conNo);
    CompanyDTO selectReqCom(String comId);

//    계약 권한 상태
    void reqUpdateComId(ContractDTO contractDTO);
    void reqContract(ContractDTO contractDTO);
    void reqUpdateContract(ContractDTO contractDTO);
    void reqUpdateContracting(ContractDTO contractDTO);
    void reqUpdateBuild(ContractDTO contractDTO);
    void reqUpdateBuildComplete(ContractDTO contractDTO);
}
