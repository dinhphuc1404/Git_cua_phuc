package com.example.mephim.service;

import com.example.mephim.entity.ShowTime;
import com.example.mephim.response.ShowTimeRes;

import java.util.List;

public interface ShowTimeService {

    List<ShowTime> findAll();
    List<ShowTimeRes> findTicketByMovieIdAndShowDateIdAndShowTimeId(Integer movieId, Integer showDateId);
}
