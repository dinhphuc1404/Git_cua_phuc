package com.example.mephim.request;

import lombok.Data;

@Data
public class UserVisibleDto {
    private Boolean isEnable;
    private String email;
    private String reason;
}
