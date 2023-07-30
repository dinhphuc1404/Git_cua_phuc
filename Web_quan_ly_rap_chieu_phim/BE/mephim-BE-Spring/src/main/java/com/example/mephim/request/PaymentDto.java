package com.example.mephim.request;

import lombok.Data;

@Data
public class PaymentDto {
    private Integer amount;
    private String vnp_OrderInfo;
    private String vnp_BankCode;
    private String vnp_TxnRef;
    private String txt_billing_mobile;
    private String txt_billing_email;
    private String txt_billing_fullname;

    // check response code: vnp_ResponseCode == 0 => success
    private String vnp_ResponseCode;
}
