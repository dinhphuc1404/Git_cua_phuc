package com.example.mephim.response;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class TransactionStatisResponse {
    private String transactionDay;
    private Integer value;
}
