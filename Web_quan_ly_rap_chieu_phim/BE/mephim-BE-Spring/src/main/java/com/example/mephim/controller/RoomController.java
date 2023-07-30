package com.example.mephim.controller;

import com.example.mephim.entity.Room;
import com.example.mephim.request.SaveRoomDto;
import com.example.mephim.request.RoomEditDto;
import com.example.mephim.response.CustomResponse;
import com.example.mephim.response.RoomSeatRes;
import com.example.mephim.response.RoomStruct;
import com.example.mephim.service.RoomService;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/room")
@CrossOrigin("*")
public class RoomController {
    @Autowired
    RoomService roomService;

    @PostMapping("/add-new-room")
    public ResponseEntity<?> addNewRoom(@RequestBody SaveRoomDto roomDto) {
        Room room1 = roomService.save(roomDto);
        return new ResponseEntity<>(new CustomResponse<>(20,room1), HttpStatus.CREATED);
    }

    @PostMapping("/edit-room")
    public ResponseEntity<?> addNewRoom(@RequestBody RoomEditDto roomDto) {
        Room room1 = roomService.edit(roomDto);
        return new ResponseEntity<>(new CustomResponse<>(20,room1), HttpStatus.CREATED);
    }

    @GetMapping("/detail-room")
    public ResponseEntity<?> detailRoom(@RequestParam(name = "roomId") Integer roomId) {
        Room room1 = roomService.detail(roomId);
        return new ResponseEntity<>(new CustomResponse<>(20,room1), HttpStatus.CREATED);
    }

    @GetMapping("/find-all-room")
    public ResponseEntity<?> findAllRoom(){
        List<Room> roomList = roomService.findAll();
        return new ResponseEntity<>(new CustomResponse<>(20,roomList), HttpStatus.CREATED);
    }

    @GetMapping("/find")
    public ResponseEntity<?> addBooking(@RequestParam(name = "showDateId") Integer showDateId,
                                        @RequestParam(name = "showTimeId") Integer showTimeId,
                                        @RequestParam(name = "ticketId") Integer ticketId) {

        List<RoomSeatRes> roomSeat = roomService.findRoomSeatByShowDateAndShowTimeTicket(showDateId, showTimeId, ticketId);
        Room room = roomService.findByTicketId(ticketId);
        JSONObject dataResponseJson=new JSONObject();
        if(room != null) {
            dataResponseJson.put("room", room);
        }
        dataResponseJson.put("roomSeat", roomSeat);
        return new ResponseEntity<>(new CustomResponse<>(20,dataResponseJson), HttpStatus.CREATED);
    }

    @GetMapping("/find-room-struct")
    public ResponseEntity<?> getRoomStruct(@RequestParam(name = "roomId") Integer roomId) {
        RoomStruct roomStruct = roomService.getRoomStruct(roomId);
        return new ResponseEntity<>(roomStruct, HttpStatus.OK);
    }


    @GetMapping(value = "/find-all")
    public ResponseEntity<?> findAllShowTime() {
        List<Room> roomList = roomService.findAll();
        return new ResponseEntity<>(new CustomResponse<>(14,roomList), HttpStatus.CREATED);
    }
}
