package com.example.mephim.controller;

import com.example.mephim.entity.Room;
import com.example.mephim.repos.RoomRepo;
import com.example.mephim.response.RoomSeatRes;
//import com.example.mephim.service.RoomSeatService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/seat")
@CrossOrigin("*")
public class RoomSeatController{

//    @Autowired
//    RoomSeatService roomSeatService;

    @Autowired
    RoomRepo roomRepo;

//    @GetMapping("/find")
//    public ResponseEntity<?> addBooking(@RequestParam(name = "showDateId") Integer showDateId,
//                                        @RequestParam(name = "showTimeId") Integer showTimeId,
//                                        @RequestParam(name = "ticketId") Integer ticketId) {
//
//        List<RoomSeatRes> roomSeat = roomSeatService.findRoomSeatByShowDateAndShowTimeTicket(showDateId,showTimeId,ticketId);
//
//        return new ResponseEntity<>(roomSeat,HttpStatus.OK);
//
//    }


    @PostMapping("/findAll")
    public ResponseEntity<?> addBooking() {

//        List<RoomSeat> roomSeat = roomSeatService.findAll();

        return new ResponseEntity<>(HttpStatus.OK);

    }

    @PostMapping("/findAll1")
    public ResponseEntity<?> findAllRoom(@RequestParam Integer id) {

        Room roomSeat = roomRepo.findById(id).orElse(null);

        return new ResponseEntity<>(HttpStatus.OK);

    }



}
