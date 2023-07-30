package com.example.mephim.response;

import org.springframework.beans.factory.annotation.Value;

public interface RateResponse {
    @Value("#{target.rate_id}")
    Integer getRateId();
    @Value("#{target.username}")
    String getUsername();
    @Value("#{target.movie_name}")
    String getMovieName();
    @Value("#{target.num_rate}")
    Integer getNumRate();
    @Value("#{target.content}")
    String getContent();
    @Value("#{target.is_liked}")
    Boolean isLiked();
}
