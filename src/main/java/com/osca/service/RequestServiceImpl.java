package com.osca.service;

import com.osca.domain.Company;
import com.osca.domain.Contract;
import com.osca.dto.CompanyDTO;
import com.osca.dto.ContractDTO;
import com.osca.dto.ListDTO;
import com.osca.dto.ListResponseDTO;
import com.osca.mapper.RequestMapper;
import lombok.RequiredArgsConstructor;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class RequestServiceImpl implements RequestService{
    private final RequestMapper requestMapper;
    private final ModelMapper modelMapper;

//    의뢰
    @Override
    public void reqInsert(ContractDTO contractDTO) {

        requestMapper.reqInsert(Contract.builder()
                        .memId(contractDTO.getMemId())
                        .conName(contractDTO.getConName())
                        .conCategory(contractDTO.getConCategory())
                        .conLocation(contractDTO.getConLocation())
                        .conSpace(contractDTO.getConSpace())
                        .conContent(contractDTO.getConContent())
                        .conRequest(contractDTO.getConRequest())
                        .conCondition(contractDTO.getConCondition())
                        .conStartDay(contractDTO.getConStartDay())
                        .conEndDay(contractDTO.getConEndDay())
                        .conPrice(contractDTO.getConPrice())
                        .conDocument(contractDTO.getConDocument())
                        .conImg(contractDTO.getConImg())
                .build());
    }
    @Override
    public void reqUpdate(ContractDTO contractDTO) {

        Contract contract = Contract.builder()
                .conNo(contractDTO.getConNo())
                .conName(contractDTO.getConName())
                .conCategory(contractDTO.getConCategory())
                .conLocation(contractDTO.getConLocation())
                .conSpace(contractDTO.getConSpace())
                .conContent(contractDTO.getConContent())
                .conRequest(contractDTO.getConRequest())
                .build();
        requestMapper.reqUpdate(contract);
    }
    @Override
    public void reqDelContract(Integer conNo) {
        requestMapper.reqDelContract(conNo);
    }

    @Override
    public ContractDTO getRequestOne(Integer conNo) {
        Contract contract = requestMapper.getRequestOne(conNo);
        ContractDTO contractDTO = modelMapper.map(contract, ContractDTO.class);

        return contractDTO;

    }

//    회원
    @Override
    public ListResponseDTO<ContractDTO> reqMemList(ListDTO listDTO, String memberId) {

        List<Contract> contractList = requestMapper.reqMemList(listDTO, memberId);

        List<ContractDTO> dtoList =
                contractList.stream().map(contract -> modelMapper.map(contract, ContractDTO.class))
                        .collect(Collectors.toList());

        return ListResponseDTO.<ContractDTO>builder()
                .dtoList(dtoList)
                .total(requestMapper.getRequestTotal(listDTO))
                .build();


    }

//    시공사
    @Override
    public CompanyDTO selectCompanyOne(Integer conNo) {
            Company company = requestMapper.selectCompanyOne(conNo);
            if(company == null) {
                return null;
//                sql결과가 없을때 DTO로 보내주긴 해야하나 보내줄 값이 없어 null을 보냄
            }
            return modelMapper.map(company, CompanyDTO.class);
//            컨트롤러에서 요청을했을때 가져온 sql값이 null이였는데 mapper가 처리해줄 수는 없지

    }
    @Override
    public CompanyDTO selectReqCom(String comId) {
        Company company = requestMapper.selectReqCom(comId);
        if(company == null) {
            return null;
//                sql결과가 없을때 DTO로 보내주긴 해야하나 보내줄 값이 없어 null을 보냄
        }

        return modelMapper.map(company, CompanyDTO.class);
//            컨트롤러에서 요청을했을때 가져온 sql값이 null이였는데 mapper가 처리해줄 수는 없지

    }

//    계약 권한 상태
    @Override
    public void reqUpdateComId(ContractDTO contractDTO) {
        Contract contract = Contract.builder()
                .conNo(contractDTO.getConNo())
                .comId(contractDTO.getComId())
                .beforePrice(contractDTO.getBeforePrice())
                .build();
        requestMapper.reqUpdateComId(contract);

    }
    @Override
    public void reqContract(ContractDTO contractDTO) {

        requestMapper.reqContract(Contract.builder()
                .comId(contractDTO.getComId())
                .memId(contractDTO.getMemId())
                .conNo(contractDTO.getConNo())
                .conPrice(contractDTO.getConPrice())
                .build());

    }
    @Override
    public void reqUpdateContract(ContractDTO contractDTO) {
        Contract contract = Contract.builder()
                .conNo(contractDTO.getConNo())
                .comId(contractDTO.getComId())
                .build();

        requestMapper.reqUpdateContract(contract);
    }
    @Override
    public void reqUpdateContracting(ContractDTO contractDTO) {
        Contract contract = Contract.builder()
                .conNo(contractDTO.getConNo())
                .memId(contractDTO.getMemId())
                .build();

        requestMapper.reqUpdateContracting(contract);
    }
    @Override
    public void reqUpdateBuild(ContractDTO contractDTO) {
        Contract contract = Contract.builder()
                .conNo(contractDTO.getConNo())
                .comId(contractDTO.getComId())
                .build();

        requestMapper.reqUpdateBuild(contract);

    }
    @Override
    public void reqUpdateBuildComplete(ContractDTO contractDTO) {
        Contract contract = Contract.builder()
                .conNo(contractDTO.getConNo())
                .memId(contractDTO.getMemId())
                .build();
        requestMapper.reqUpdateBuildComplete(contract);

    }


}
