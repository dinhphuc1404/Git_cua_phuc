package com.example.mephim.repos;

import com.example.mephim.entity.Booking;
import com.example.mephim.response.TransactionResponse;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TransactionRepo extends JpaRepository<Booking, Integer> {
    @Query(value = "select booking.booking_id, booking.time, users.username, movie.movie_name,\n" +
            "GROUP_CONCAT( CONCAT(seat_row.row_name, seat_column.column_name) SEPARATOR ',') as 'seat',\n" +
            "SUM(ticket.ticket_price) as price, booking.point_of_use, booking.reward_point\n" +
            "from booking inner join users inner join ticket inner join movie\n" +
            "inner join seat inner join seat_column inner join seat_row\n" +
            "on users.id = booking.user_id\n" +
            "where booking.ticket_id = ticket.ticket_id\n" +
            "and ticket.movie_id = movie.movie_id\n" +
            "and booking.seat_id = seat.seat_id\n" +
            "and seat.seat_column_id = seat_column.column_id\n" +
            "and seat.seat_row_id = seat_row.row_id\n" +
            "and users.username = ?\n" +
            "group by users.username, booking.time\n" +
            "order by booking.booking_id desc LIMIT 10;", nativeQuery = true)
    List<TransactionResponse> findByMail(String mail);
}
