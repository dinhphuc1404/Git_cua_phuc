package com.example.mephim.repos;

import com.example.mephim.entity.Booking;
import com.example.mephim.response.ICategoryStatisResponse;
import com.example.mephim.response.IMovieStatisResponse;
import com.example.mephim.response.ITransStatisResponse;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface StatisRepo extends JpaRepository<Booking, Integer> {
    @Query(value = "SELECT COALESCE(DATE(booking.time), 'TOTAL') AS transaction_day,\n" +
            "sum(ticket.ticket_price) as 'value' from booking inner join ticket inner join users\n" +
            "where booking.ticket_id = ticket.ticket_id\n" +
            "and booking.user_id = users.id\n" +
            "and booking.time >= DATE(NOW() - INTERVAL ? MONTH)\n" +
            "group by DATE(booking.time)\n" +
            "WITH ROLLUP;", nativeQuery = true)
    List<ITransStatisResponse> getStatisTransactionByMonthAgo(Integer numMonth);
    @Query(value = "SELECT COALESCE(DATE(booking.time), 'TOTAL') AS transaction_day,\n" +
            "sum(ticket.ticket_price) as 'value' from booking inner join ticket inner join users\n" +
            "where booking.ticket_id = ticket.ticket_id\n" +
            "and booking.user_id = users.id\n" +
            "and booking.time >= DATE(NOW() - INTERVAL ? DAY)\n" +
            "group by DATE(booking.time)\n" +
            "WITH ROLLUP;", nativeQuery = true)
    List<ITransStatisResponse> getStatisTransactionByDayAgo(Integer numDay);
    @Query(value = "SELECT CONCAT(MONTH(DATE(booking.time)),'-',YEAR(DATE(booking.time))) AS transaction_day,\n" +
            "sum(ticket.ticket_price) as 'value' from booking inner join ticket inner join users\n" +
            "where booking.ticket_id = ticket.ticket_id\n" +
            "and booking.user_id = users.id\n" +
            "and booking.time >= DATE(NOW() - INTERVAL 1 YEAR)\n" +
            "group by YEAR(DATE(booking.time)), MONTH(DATE(booking.time))\n" +
            "order by YEAR(DATE(booking.time)), MONTH(DATE(booking.time)) asc;", nativeQuery = true)
    List<ITransStatisResponse> getTransactionChangeOnYear();
    @Query(value = "SELECT DATE(booking.time) as transaction_day,\n" +
            "sum(ticket.ticket_price) as 'value' from booking inner join ticket inner join users\n" +
            "where booking.ticket_id = ticket.ticket_id\n" +
            "and booking.user_id = users.id\n" +
            "and booking.time >= DATE(NOW() - INTERVAL 1 WEEK)\n" +
            "group by DATE(booking.time)\n" +
            "order by DATE(booking.time) asc;", nativeQuery = true)
    List<ITransStatisResponse> getTransactionChaneOnWeek();
    @Query(value = "SELECT movie.movie_name, count(booking.booking_id) as 'num_of_booking', sum(ticket.ticket_price) as 'value' from booking inner join ticket\n" +
            "inner join movie\n" +
            "where booking.ticket_id = ticket.ticket_id\n" +
            "and ticket.movie_id = movie.movie_id\n" +
            "and booking.time >= DATE(NOW() - INTERVAL ? DAY)\n" +
            "group by movie.movie_id\n" +
            "order by num_of_booking desc;", nativeQuery = true)
    List<IMovieStatisResponse> getMovieStatics(Integer numOfDay);

    @Query(value = "call getCategoryStatisBy1WeeksAgo(?);", nativeQuery = true)
    List<ICategoryStatisResponse> getCategoryStatisBy1WeeksAgo(Integer daysAgo);
}
