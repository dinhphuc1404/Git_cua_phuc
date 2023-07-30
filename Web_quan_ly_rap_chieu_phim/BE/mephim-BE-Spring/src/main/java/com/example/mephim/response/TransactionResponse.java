package com.example.mephim.response;
import org.springframework.beans.factory.annotation.Value;

public interface TransactionResponse {
    @Value("#{target.time}")
    String getTime();
    @Value("#{target.movie_name}")
    String getMovieName();
    @Value("#{target.seat}")
    String getSeat();
    @Value("#{target.price}")
    String getPrice();
    @Value("#{target.point_of_use}")
    Integer getPointOfUser();
    @Value("#{target.reward_point}")
    Integer getRewardPoint();
}
