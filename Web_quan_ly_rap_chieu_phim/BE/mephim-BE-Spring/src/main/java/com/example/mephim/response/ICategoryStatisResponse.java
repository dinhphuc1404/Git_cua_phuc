package com.example.mephim.response;

import org.springframework.beans.factory.annotation.Value;

public interface ICategoryStatisResponse {
    @Value("#{target.category_name}")
    String getCategoryName();
    @Value("#{target.num_of_booking}")
    Integer getNumOfBooking();
}
