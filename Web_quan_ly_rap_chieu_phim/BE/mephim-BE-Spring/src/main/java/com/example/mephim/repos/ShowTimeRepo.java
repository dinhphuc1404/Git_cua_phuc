package com.example.mephim.repos;

import com.example.mephim.entity.ShowTime;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ShowTimeRepo extends JpaRepository<ShowTime, Integer> {
    // Default JPA queries
    ShowTime findByShowTimeId(Integer showTimeId);
    @Query(value = "select show_time.* from show_time inner join ticket inner join movie inner join show_date\n" +
            "where show_time.show_time_id = ticket.show_time_id\n" +
            "and ticket.show_date_id = show_date.show_date_id\n" +
            "and ticket.movie_id = movie.movie_id\n" +
            "and ticket.movie_id = ?\n" +
            "and ticket.show_date_id = ?\n" +
            "and ticket.active = 1;", nativeQuery = true)
    List<ShowTime> findShowTimeByShowDate(Integer movieId, Integer showDateId);
}
