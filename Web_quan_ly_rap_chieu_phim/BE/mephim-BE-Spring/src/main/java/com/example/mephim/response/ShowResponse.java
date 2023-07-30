package com.example.mephim.response;

import org.springframework.beans.factory.annotation.Value;

public interface ShowResponse {
    @Value("#{target.ticket_id}")
    Integer getTicketId();
    @Value("#{target.movie_id}")
    Integer getMovieId();
    @Value("#{target.movie_name}")
    String getMovieName();
    @Value("#{target.room_id}")
    Integer getRoomId();
    @Value("#{target.room_name}")
    String getRoomName();
    @Value("#{target.time_start}")
    String getTimeStart();
    @Value("#{target.time_end}")
    String getTimeEnd();
    @Value("#{target.movie_length}")
    Integer getMovieLength();
    @Value("#{target.ticket_price}")
    Integer getTicketPrice();
}