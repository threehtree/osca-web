package com.osca.service;

import com.osca.domain.Contract;
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

    @Override
    public void reqInsert(ContractDTO contractDTO) {

        requestMapper.reqInsert(Contract.builder()
                        .memId(contractDTO.getMemId())
                        .conName(contractDTO.getConName())
                        .conCategory(contractDTO.getConCategory())
                        .conLocation(contractDTO.getConLocation())
                .build());
    }

    @Override
    public ListResponseDTO<ContractDTO> getContractList(ListDTO listDTO, String memberId) {

        List<Contract> contractList = requestMapper.selectRequestList(listDTO, memberId);

        List<ContractDTO> dtoList =
                contractList.stream().map(contract -> modelMapper.map(contract, ContractDTO.class))
                        .collect(Collectors.toList());

        return ListResponseDTO.<ContractDTO>builder()
                .dtoList(dtoList)
                .total(requestMapper.getRequestTotal(listDTO))
                .build();


    }

}
