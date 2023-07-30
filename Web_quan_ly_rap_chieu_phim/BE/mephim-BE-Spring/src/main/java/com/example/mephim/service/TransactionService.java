package com.example.mephim.service;

import com.example.mephim.response.TransactionResponse;

import java.util.List;

public interface TransactionService {
    List<TransactionResponse> findByMail(String mail);
}
