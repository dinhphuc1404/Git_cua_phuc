package com.example.mephim.repos;

import com.example.mephim.entity.ShowDate;
import com.example.mephim.response.ShowResponse;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ShowDateRepo extends JpaRepository<ShowDate, Integer> {

    // Default JPA queries
    ShowDate findByShowDateId(Integer showDateId);

    @Query(value = "select show_date.* from show_date \n" +
            "inner join ticket \n" +
            "inner join movie \n" +
            "where show_date.show_date_id = ticket.show_date_id \n" +
            "and movie.movie_id = ticket.movie_id\n" +
            "and movie.movie_id = ?\n" +
            "and ticket.active = 1", nativeQuery = true)
    List<ShowDate> findShowDateByMovieId(Integer movieId);
    @Query(value = "select distinct show_date.* from show_date inner join ticket inner join movie inner join movie_theater\n" +
            "where show_date.show_date_id = ticket.show_date_id\n" +
            "and movie.movie_id = ticket.movie_id\n" +
            "and movie_theater.movie_id = movie.movie_id\n" +
            "and ticket.active = 1\n" +
            "and movie_theater.theater_id = ?;", nativeQuery = true)
    List<ShowDate> findShowDateByTheaterId(Integer theaterId);

    @Query(value = "select ticket.ticket_id, show_date.show_date_id, show_time.show_time_id, movie.movie_id, room.room_id,\n" +
            "movie.movie_name, ticket.ticket_price,\n" +
            "STR_TO_DATE(concat(show_date.date,' ', show_time.time), '%Y-%m-%d %T') as time_start, \n" +
            "STR_TO_DATE(concat(show_date.date,' ', show_time.time), '%Y-%m-%d %T') + INTERVAL movie.movie_length MINUTE as time_end,\n" +
            "movie.movie_length, room.room_name from show_date \n" +
            "inner join show_time inner join movie inner join ticket \n" +
            "inner join room\n" +
            "where show_date.show_date_id = ticket.show_date_id\n" +
            "and show_time.show_time_id = ticket.show_time_id\n" +
            "and ticket.room_id = room.room_id\n" +
            "and ticket.is_deleted = false\n" +
            "and movie.movie_id = ticket.movie_id", nativeQuery = true)
    List<ShowResponse> adminFindAllShow();
    @Query(value = "select ticket.ticket_id, show_date.show_date_id, show_time.show_time_id, movie.movie_id, room.room_id,\n" +
            "movie.movie_name, ticket.ticket_price,\n" +
            "STR_TO_DATE(concat(show_date.date,' ', show_time.time), '%Y-%m-%d %T') as time_start, \n" +
            "STR_TO_DATE(concat(show_date.date,' ', show_time.time), '%Y-%m-%d %T') + INTERVAL movie.movie_length MINUTE as time_end,\n" +
            "movie.movie_length, room.room_name from show_date \n" +
            "inner join show_time inner join movie inner join ticket \n" +
            "inner join room\n" +
            "where show_date.show_date_id = ticket.show_date_id\n" +
            "and show_time.show_time_id = ticket.show_time_id\n" +
            "and ticket.room_id = room.room_id\n" +
            "and ticket.is_deleted = false\n" +
            "and movie.movie_name LIKE CONCAT('%',?,'%')\n" +
            "and movie.movie_id = ticket.movie_id", nativeQuery = true)
    List<ShowResponse> adminFindAllShowByMovie(String movieName);
}
