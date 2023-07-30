package com.example.mephim.service;

import com.example.mephim.entity.Rate;
import com.example.mephim.exception.NotAllowRating;
import com.example.mephim.request.AddRateDto;
import com.example.mephim.response.RateResponse;

import java.util.List;

public interface RateService {
    List<RateResponse> getListRateByMovie(Integer movieId);
    List<RateResponse> findAllRate();
    Rate addRate(AddRateDto addRateDto) throws NotAllowRating;
    void reactRate(Integer rateId, Boolean isLike);
    void deleteRate(Integer rateId);
}
