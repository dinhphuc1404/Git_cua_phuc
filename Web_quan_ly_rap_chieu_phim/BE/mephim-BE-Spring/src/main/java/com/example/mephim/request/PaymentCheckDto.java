package com.example.mephim.request;

import lombok.Data;

@Data
public class PaymentCheckDto {
    private String order_id;
    private String trans_date;

}
