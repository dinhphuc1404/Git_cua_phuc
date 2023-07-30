package com.example.mephim.service;

import com.example.mephim.entity.Seat;

import java.util.List;

public interface SeatService {
    void save(Seat seat);
    void deleteAllSeatByRoom(Integer roomId);
    List<Seat> seatInRoom(Integer roomId);
    Seat findById(Integer seatId);
    Seat findSeatByTicketIdAndSeatId(Integer ticketId, Integer seatId);
}
