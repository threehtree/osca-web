package com.osca.service;

import com.osca.dto.ReplyDTO;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;




public interface ReplyService {

    List<ReplyDTO>  getListOfContract(Integer conNo);

}
