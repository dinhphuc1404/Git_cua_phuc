package com.example.mephim.repos;

import com.example.mephim.entity.Movie;
import com.sun.org.apache.xpath.internal.operations.Bool;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public interface MovieRepo extends JpaRepository<Movie, Integer> {

    Movie findMovieByMovieId(Integer movieId);

//    @Query(value="select movie_id, movie_description, movie_length, movie_name, movie_poster, movie_trailer_url from movie",nativeQuery = true)
    List<Movie> findAll();
    @Query(value = "select * from movie where movie.is_enable = true and movie.is_delete = false", nativeQuery = true)
    List<Movie> findAllForUser();
    @Query(value = "select * from movie where movie.is_delete = false", nativeQuery = true)
    List<Movie> findAllForAdmin();
    @Query(value = "select * from movie where movie.movie_name LIKE CONCAT('%',?,'%') ;", nativeQuery = true)
    List<Movie> findByMovieName(String movieName);
    @Query(value = "select movie.* from movie \n" +
            "inner join ticket\n" +
            "inner join show_date inner join show_time\n" +
            "where ticket.show_date_id = show_date.show_date_id\n" +
            "and movie.movie_id = ticket.movie_id and ticket.active = 1\n" +
            "and ticket.show_time_id = show_time.show_time_id\n" +
            "and ticket.movie_id = movie.movie_id\n" +
            "and (STR_TO_DATE(concat(show_date.date,' ', show_time.time), '%Y-%m-%d %T') Between NOW() AND DATE_ADD(NOW(), INTERVAL 7 DAY))\n" +
            "group by movie.movie_id;", nativeQuery = true)
    List<Movie> findMovieHasTicket();
//    void saveMovie(Movie movie);
    @Query(value="select distinct movie.* from movie inner join ticket inner join show_date\n" +
            "where movie.movie_id = ticket.movie_id\n" +
            "and ticket.show_date_id = show_date.show_date_id\n" +
            "and show_date.show_date_id = ?\n" +
            "and ticket.active = 1",nativeQuery = true)
    List<Movie> getMovieByShowDate(Integer showDateId);

    @Query(value = "select distinct * from movie inner join movie_theater where movie.movie_id = movie_theater.movie_id\n" +
            "and movie_theater.theater_id = 1", nativeQuery = true)
    List<Movie> findMovieByTheaterId(Integer theaterId);

    @Query(value = "select movie.* from movie inner join movie_category inner join ticket \n" +
            "inner join show_date inner join show_time\n" +
            "where ticket.show_date_id = show_date.show_date_id\n" +
            "and movie.movie_id = movie_category.movie_id\n" +
            "and movie.movie_id = ticket.movie_id and ticket.active = 1\n" +
            "and ticket.show_time_id = show_time.show_time_id\n" +
            "and ticket.movie_id = movie.movie_id\n" +
            "and (STR_TO_DATE(concat(show_date.date,' ', show_time.time), '%Y-%m-%d %T') Between NOW() AND DATE_ADD(NOW(), INTERVAL 7 DAY))\n" +
            "and movie.movie_name LIKE CONCAT('%',?,'%')\n" +
            "and movie_category.category_id = ?\n" +
            "group by movie.movie_id", nativeQuery = true)
    List<Movie> findMovieHasTicketAndSearch(String keySearch, Integer categoryId);

    @Query(value = "select movie.* from movie inner join movie_category inner join ticket \n" +
            "inner join show_date inner join show_time\n" +
            "where ticket.show_date_id = show_date.show_date_id\n" +
            "and movie.movie_id = movie_category.movie_id\n" +
            "and movie.movie_id = ticket.movie_id and ticket.active = 1\n" +
            "and ticket.show_time_id = show_time.show_time_id\n" +
            "and ticket.movie_id = movie.movie_id\n" +
            "and (STR_TO_DATE(concat(show_date.date,' ', show_time.time), '%Y-%m-%d %T') Between NOW() AND DATE_ADD(NOW(), INTERVAL 7 DAY))\n" +
            "and movie.movie_name LIKE CONCAT('%',?,'%')\n" +
            "group by movie.movie_id", nativeQuery = true)
    List<Movie> findMovieHasTicketAndSearchByName(String keySearch);

    @Query(value = "select movie.* from movie inner join movie_category inner join ticket \n" +
            "inner join show_date inner join show_time\n" +
            "where ticket.show_date_id = show_date.show_date_id\n" +
            "and movie.movie_id = movie_category.movie_id\n" +
            "and movie.movie_id = ticket.movie_id and ticket.active = 1\n" +
            "and ticket.show_time_id = show_time.show_time_id\n" +
            "and ticket.movie_id = movie.movie_id\n" +
            "and (STR_TO_DATE(concat(show_date.date,' ', show_time.time), '%Y-%m-%d %T') Between NOW() AND DATE_ADD(NOW(), INTERVAL 7 DAY))\n" +
            "and movie_category.category_id = ?\n" +
            "group by movie.movie_id", nativeQuery = true)
    List<Movie> findMovieHasTicketAndSearchByCategory(Integer categoryId);

    @Transactional
    @Modifying
    @Query(value = "update movie set movie.is_enable = ? where movie.movie_id = ?;", nativeQuery = true)
    void visibleMovie(Boolean isVisible, Integer movieId);

    @Transactional
    @Modifying
    @Query(value = "update movie set is_enable = false, is_delete = true where movie.movie_id = ?;", nativeQuery = true)
    void deleteMovie(Integer movieId);
}
