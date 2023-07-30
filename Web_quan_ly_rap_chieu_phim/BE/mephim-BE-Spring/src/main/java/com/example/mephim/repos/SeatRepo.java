package com.example.mephim.repos;

import com.example.mephim.entity.Seat;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public interface SeatRepo extends JpaRepository<Seat, Integer> {
    @Query(value = "select seat.* from seat inner join room inner join ticket\n" +
            "where seat.room_id = room.room_id\n" +
            "and room.room_id = ticket.room_id\n" +
            "and ticket.ticket_id = ?\n" +
            "and seat.seat_id = ?", nativeQuery = true)
    // To do check the seat is existed in the room
    Seat findSeatByTicketIdAndSeatId(Integer ticketId, Integer seatId);
    @Transactional
    @Modifying
    @Query(value = "DELETE FROM seat WHERE seat.room_id = ?;", nativeQuery = true)
    void deleteAllSeatByRoom(Integer roomId);

    @Query(value = "DELETE FROM seat WHERE seat.room_id = ?;", nativeQuery = true)
    List<Seat> findByRoom(Integer roomId);
}
