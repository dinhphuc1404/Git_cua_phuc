package com.example.mephim.payload.request;

import lombok.Data;

import javax.validation.constraints.NotBlank;

@Data
public class RequestResetPasswordRequest {
    @NotBlank
    private String email;
}
