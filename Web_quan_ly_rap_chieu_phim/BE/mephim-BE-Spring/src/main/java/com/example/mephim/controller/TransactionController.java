package com.example.mephim.controller;

import com.example.mephim.request.TransactionDto;
import com.example.mephim.response.CustomResponse;
import com.example.mephim.response.TransactionResponse;
import com.example.mephim.service.TransactionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/transaction")
@CrossOrigin("*")
public class TransactionController {

    @Autowired
    TransactionService transactionService;

    @PostMapping("/get-trans-by-email")
    public ResponseEntity<?> findTransactionByEmail(@RequestBody TransactionDto transactionDto) {
        List<TransactionResponse> transactionResponse = transactionService.findByMail(transactionDto.getMail());
        return new ResponseEntity<>(new CustomResponse<>(1,transactionResponse), HttpStatus.OK);
    }
}
