package com.example.mephim.service.impl;

import com.example.mephim.repos.TransactionRepo;
import com.example.mephim.response.TransactionResponse;
import com.example.mephim.service.TransactionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class TransactionServiceImpl implements TransactionService {
    @Autowired
    TransactionRepo transactionRepo;

    @Override
    public List<TransactionResponse> findByMail(String mail) {
        return transactionRepo.findByMail(mail);
    }
}
