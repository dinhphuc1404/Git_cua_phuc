package com.example.mephim.repos;

import com.example.mephim.entity.Booking;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BookingRepo extends JpaRepository<Booking, Integer> {
    @Query(value = "select booking.* from booking inner join ticket where booking.ticket_id = ticket.ticket_id and booking.seat_id = ? and booking.ticket_id = ?;", nativeQuery = true)
    Booking findBookingByRoomSeatAndTicket(Integer roomSeatId, Integer ticketId);

    @Query(value = "select booking.* from booking inner join users inner join ticket inner join movie\n" +
            "where users.id = booking.user_id\n" +
            "and ticket.ticket_id = booking.ticket_id\n" +
            "and ticket.movie_id = movie.movie_id\n" +
            "and users.username = ?\n" +
            "and movie.movie_id = ?", nativeQuery = true)
    List<Booking> findBookingByUserAndMovie(String username, Integer movieId);
}
