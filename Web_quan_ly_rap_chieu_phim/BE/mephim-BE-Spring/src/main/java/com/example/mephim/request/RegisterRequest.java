package com.example.mephim.request;

import lombok.Data;

import javax.validation.constraints.NotNull;

@Data
public class RegisterRequest {
    @NotNull
    private String username;
    @NotNull
    private String password;
    private String address;
    @NotNull
    private String userMail;
    private String userPhone;
    private String provider;
}
