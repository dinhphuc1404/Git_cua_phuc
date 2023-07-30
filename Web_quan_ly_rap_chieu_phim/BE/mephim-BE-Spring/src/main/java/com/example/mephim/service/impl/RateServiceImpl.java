package com.example.mephim.service.impl;

import com.example.mephim.entity.Booking;
import com.example.mephim.entity.Movie;
import com.example.mephim.entity.Rate;
import com.example.mephim.entity.User;
import com.example.mephim.exception.NotAllowRating;
import com.example.mephim.repos.BookingRepo;
import com.example.mephim.repos.MovieRepo;
import com.example.mephim.repos.RateRepo;
import com.example.mephim.repos.UserRepository;
import com.example.mephim.request.AddRateDto;
import com.example.mephim.response.RateResponse;
import com.example.mephim.service.RateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RateServiceImpl implements RateService {
    @Autowired
    RateRepo rateRepo;
    @Autowired
    UserRepository userRepository;
    @Autowired
    MovieRepo movieRepo;
    @Autowired
    BookingRepo bookingRepo;

    @Override
    public List<RateResponse> getListRateByMovie(Integer movieId) {
        return rateRepo.listRateFromMovie(movieId);
    }

    @Override
    public List<RateResponse> findAllRate() {
        return rateRepo.findAllRate();
    }

    @Override
    public Rate addRate(AddRateDto addRateDto) throws NotAllowRating {
        System.out.println("IS ALLOW: " + isAllowAddRate(addRateDto.getUsername(), addRateDto.getMovieId()));
        if(!isAllowAddRate(addRateDto.getUsername(), addRateDto.getMovieId())) {
            throw new NotAllowRating();
        }
        User user = userRepository.findByUsername(addRateDto.getUsername()).orElseThrow(() -> new UsernameNotFoundException("User Not Found with username: " + addRateDto.getUsername()));
        Movie movie = movieRepo.findMovieByMovieId(addRateDto.getMovieId());
        Rate rate = new Rate();
        rate.setUser(user);
        rate.setMovie(movie);
        rate.setNumRate(addRateDto.getNumRate());
        rate.setContent(addRateDto.getContent());
        rate.setIsLiked(false);
        rate.setIsDeleted(false);
        Rate rateSaved;
        try {
            rateSaved = rateRepo.save(rate);
        } catch (DataIntegrityViolationException e) {
            throw new NotAllowRating();
        }
        return rateSaved;
    }

    @Override
    public void reactRate(Integer rateId, Boolean isLike) {
        rateRepo.reactRate(isLike, rateId);
    }

    @Override
    public void deleteRate(Integer rateId) {
        rateRepo.deleteRate(rateId);
    }

    boolean isAllowAddRate(String username, Integer movieId) {
        List<Rate> rateList = rateRepo.findRateByUserAndMovie(username, movieId);
        List<Booking> bookingList = bookingRepo.findBookingByUserAndMovie(username, movieId);
        System.out.println("SIZE: "+ rateList.size());
        System.out.println("SIZE 1: "+ bookingList.size());
        return rateList.size() == 0 && bookingList.size() > 0;
    }
}
