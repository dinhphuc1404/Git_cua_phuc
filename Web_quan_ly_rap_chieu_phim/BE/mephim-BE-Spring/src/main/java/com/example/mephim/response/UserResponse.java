package com.example.mephim.response;

import org.springframework.beans.factory.annotation.Value;

public interface UserResponse {
    @Value("#{target.id}")
    Integer getId();
    @Value("#{target.email}")
    String getEmail();
    @Value("#{target.phone}")
    String getPhone();
    @Value("#{target.name}")
    String getName();
    @Value("#{target.register_date}")
    String getRegisterDate();
    @Value("#{target.available_point}")
    Integer getAvailablePoint();
    @Value("#{target.is_enable}")
    Boolean getIsEnable();
}
