package com.example.mephim.response;

import lombok.Data;
import org.springframework.beans.factory.annotation.Value;

public interface ITransStatisResponse {
    @Value("#{target.transaction_day}")
    String getTransactionDay();
    @Value("#{target.value}")
    Integer getValue();
}
