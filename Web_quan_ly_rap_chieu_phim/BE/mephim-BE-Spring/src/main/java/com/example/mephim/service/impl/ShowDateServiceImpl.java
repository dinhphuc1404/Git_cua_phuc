package com.example.mephim.service.impl;

import com.example.mephim.entity.ShowDate;
import com.example.mephim.entity.ShowTime;
import com.example.mephim.repos.ShowDateRepo;
import com.example.mephim.response.ShowResponse;
import com.example.mephim.service.ShowDateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ShowDateServiceImpl implements ShowDateService {

    @Autowired
    ShowDateRepo showDateRepo;

    @Override
    public List<ShowDate> findAll() {
        return showDateRepo.findAll();
    }

    @Override
    public List<ShowDate> findShowDateByTheaterId(Integer theaterId) {
        return showDateRepo.findShowDateByTheaterId(theaterId);
    }

    @Override
    public List<ShowDate> findShowDateByMovieId(Integer movieId) {
        return showDateRepo.findShowDateByMovieId(movieId);
    }

    @Override
    public List<ShowResponse> adminFindAllShow() {
        return showDateRepo.adminFindAllShow();
    }

    @Override
    public List<ShowResponse> adminFindAllShowByMovie(String movieName) {
        return showDateRepo.adminFindAllShowByMovie(movieName);
    }

    @Override
    public ShowDate findShowDateById(Integer showDateId) {
        return showDateRepo.findById(showDateId).orElse(null);
    }
}
