package com.example.mephim.payload.request;

import lombok.Data;

@Data
public class ResetPasswordRequest {
    private String verifyCode;
    private String password;
}
