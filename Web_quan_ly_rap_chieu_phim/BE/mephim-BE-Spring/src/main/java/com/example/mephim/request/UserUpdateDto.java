package com.example.mephim.request;

import lombok.Data;

@Data
public class UserUpdateDto {
    private String name;
    private String phone;
    private String email;
}
