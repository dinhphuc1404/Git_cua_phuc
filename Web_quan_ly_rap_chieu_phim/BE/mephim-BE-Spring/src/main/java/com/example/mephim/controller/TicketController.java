package com.example.mephim.controller;

import com.example.mephim.constants.Constants;
import com.example.mephim.constants.ERROR_CODE;
import com.example.mephim.entity.Booking;
import com.example.mephim.entity.Ticket;
import com.example.mephim.exception.ShowConflictBySameMovieInTimeException;
import com.example.mephim.exception.ShowConflictBySameRoomException;
import com.example.mephim.request.DeleteTicketDto;
import com.example.mephim.request.TicketCreateDto;
import com.example.mephim.response.CustomResponse;
import com.example.mephim.service.TicketService;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/ticket")
@CrossOrigin("*")
public class TicketController {

    @Autowired
    TicketService ticketService;

    @GetMapping("/find-all")
    public ResponseEntity<?> findAllTicket() {
        List<Ticket> ticketList = ticketService.findAll();
        return new ResponseEntity<>(new CustomResponse<>(1,ticketList), HttpStatus.OK);
    }
    @GetMapping("/find-by-movie")
    public ResponseEntity<?> findTicketByMovie(@RequestParam String movieName) {
        List<Ticket> ticketList = ticketService.findTicketByMovie(movieName);
        return new ResponseEntity<>(new CustomResponse<>(1,ticketList), HttpStatus.OK);
    }

    @PostMapping("/create-new")
    public ResponseEntity<?> createNewTicket(@RequestBody TicketCreateDto ticketCreateDto) {
        Object result;
        try {
            result = ticketService.save(ticketCreateDto);
        } catch (ShowConflictBySameMovieInTimeException  e) {
            JSONObject dataResponseJson=new JSONObject();
            dataResponseJson.put("conflictTicket", e.getData());
            return new ResponseEntity<>(new CustomResponse<>(-21,dataResponseJson), HttpStatus.EXPECTATION_FAILED);
        } catch (ShowConflictBySameRoomException e) {
            JSONObject dataResponseJson=new JSONObject();
            dataResponseJson.put("conflictTicket", e.getData());
            return new ResponseEntity<>(new CustomResponse<>(-22,dataResponseJson), HttpStatus.EXPECTATION_FAILED);
        }

        JSONObject dataResponseJson=new JSONObject();
        dataResponseJson.put("ticket", result);
        return new ResponseEntity<>(new CustomResponse<>(25, dataResponseJson), HttpStatus.CREATED);
    }

    @PostMapping("/delete-ticket")
    public ResponseEntity<?> createNewTicket(@RequestBody DeleteTicketDto ticketDto) {
        boolean status = ticketService.deleteTicket(ticketDto.getTicketId());
        return new ResponseEntity<>(new CustomResponse<>(25, status), HttpStatus.CREATED);
    }
}
