package com.example.mephim.controller;

import com.example.mephim.exception.NotAllowRating;
import com.example.mephim.request.AddRateDto;
import com.example.mephim.request.DeleteRateDto;
import com.example.mephim.request.ReactRateDto;
import com.example.mephim.response.CustomResponse;
import com.example.mephim.response.RateResponse;
import com.example.mephim.service.RateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/rate")
@CrossOrigin("*")
public class RateController {
    @Autowired
    RateService rateService;

    @PostMapping("/add")
    public ResponseEntity<?> addRate(@RequestBody AddRateDto rateDto) throws NotAllowRating {
        rateService.addRate(rateDto);
        return new ResponseEntity<>(new CustomResponse<>(1, rateDto), HttpStatus.OK);
    }

    @GetMapping("/find")
    public ResponseEntity<?> findByMovie(@RequestParam Integer movieId) {
        List<RateResponse> rateResponseList = rateService.getListRateByMovie(movieId);
        return new ResponseEntity<>(new CustomResponse<>(1, rateResponseList), HttpStatus.OK);
    }

    @GetMapping("/find-all")
    public ResponseEntity<?> findAllRate() {
        List<RateResponse> rateResponseList = rateService.findAllRate();
        return new ResponseEntity<>(new CustomResponse<>(1, rateResponseList), HttpStatus.OK);
    }
    @PostMapping("/react")
    public ResponseEntity<?> reactRate(@RequestBody ReactRateDto rateDto) {
        rateService.reactRate(rateDto.getRateId(), rateDto.getIsLike());
        return new ResponseEntity<>(new CustomResponse<>(1, rateDto.getRateId()), HttpStatus.OK);
    }
    @PostMapping("/delete")
    public ResponseEntity<?> reactRate(@RequestBody DeleteRateDto rateDto) {
        rateService.deleteRate(rateDto.getRateId());
        return new ResponseEntity<>(new CustomResponse<>(1, rateDto.getRateId()), HttpStatus.OK);
    }
}
