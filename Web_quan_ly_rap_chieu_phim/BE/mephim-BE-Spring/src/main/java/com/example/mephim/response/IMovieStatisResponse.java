package com.example.mephim.response;

import org.springframework.beans.factory.annotation.Value;

public interface IMovieStatisResponse {
    @Value("#{target.movie_name}")
    String getMovieName();
    @Value("#{target.num_of_booking}")
    Integer getNumOfBooking();
    @Value("#{target.value}")
    Integer getValue();
}
