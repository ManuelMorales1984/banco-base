package com.banco.base.service;

import com.banco.base.domain.PagosDTO;
import com.banco.base.entity.PagosEntity;
import org.springframework.http.ResponseEntity;

import java.util.List;

public interface PagosService {

    ResponseEntity<List<PagosDTO>> allpagos();
    ResponseEntity<PagosDTO> savePago(PagosDTO pago);
    ResponseEntity<PagosDTO> pago(Integer idPago);

    ResponseEntity<PagosDTO> uptStaus(Integer idPago,String status);
}
