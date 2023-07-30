package com.example.mephim.request;

import lombok.Data;

@Data
public class UserUpdatePasswordDto {
    private String newPassword;
    private String email;
}
