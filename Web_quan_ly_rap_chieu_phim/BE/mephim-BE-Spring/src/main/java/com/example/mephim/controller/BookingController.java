package com.example.mephim.controller;

import com.example.mephim.constants.ERROR_CODE;
import com.example.mephim.exception.InvalidParamException;
import com.example.mephim.exception.SeatIsBookedException;
import com.example.mephim.request.BookingDto;
import com.example.mephim.response.BookedResponse;
import com.example.mephim.response.CustomResponse;
import com.example.mephim.service.BookingService;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@CrossOrigin("*")
@RequestMapping("/api/booking")
public class BookingController {
    @Autowired
    BookingService bookingService;

    @PostMapping("/addNew")
    public ResponseEntity<?> addBooking(@RequestBody BookingDto bookingDto) {
        BookedResponse bookedResponse;
        try {
            bookedResponse = bookingService.saveBooking(bookingDto);
        } catch (InvalidParamException | SeatIsBookedException e) {
            return new ResponseEntity<>(new CustomResponse<>(ERROR_CODE.CONFLICT_ROOM,e.getMessage()), HttpStatus.EXPECTATION_FAILED);
        }
        JSONObject dataResponseJson=new JSONObject();
        dataResponseJson.put("bookingId", bookedResponse);
        return new ResponseEntity<>(new CustomResponse<>(200, dataResponseJson), HttpStatus.CREATED);
    }
}