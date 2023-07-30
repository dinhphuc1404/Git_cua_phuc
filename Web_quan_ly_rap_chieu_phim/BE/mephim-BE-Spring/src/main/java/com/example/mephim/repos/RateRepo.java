package com.example.mephim.repos;

import com.example.mephim.entity.Rate;
import com.example.mephim.response.RateResponse;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public interface RateRepo extends JpaRepository<Rate,Integer> {
    @Query(value = "select rate.rate_id, users.username, movie.movie_name, rate.num_rate, rate.content, rate.is_liked \n" +
            "from rate inner join users \n" +
            "inner join movie\n" +
            "where users.id = rate.user_id\n" +
            "and rate.movie_id = movie.movie_id\n" +
            "and rate.movie_id = ?\n" +
            "and rate.is_deleted = b'0'\n"+
            "order by rate.rate_id desc;", nativeQuery = true)
    List<RateResponse> listRateFromMovie(Integer movieId);

    @Query(value = "select rate.rate_id, users.username, movie.movie_name, rate.num_rate, rate.content, rate.is_liked \n" +
            "from rate inner join users \n" +
            "inner join movie\n" +
            "where users.id = rate.user_id\n" +
            "and rate.movie_id = movie.movie_id\n" +
            "and rate.is_deleted = false\n"+
            "order by rate.rate_id desc;", nativeQuery = true)
    List<RateResponse> findAllRate();

    @Query(value = "select rate.* from rate inner join users inner join movie where \n" +
            "users.id = rate.user_id\n" +
            "and movie.movie_id = rate.rate_id\n" +
            "and rate.is_deleted = false\n"+
            "and movie.movie_id = ? and users.username=?", nativeQuery = true)
    List<Rate> findRateByUserAndMovie(String username, Integer movieId);

    @Transactional
    @Modifying
    @Query(value = "update rate set is_liked = ? where rate.rate_id = ?;", nativeQuery = true)
    void reactRate(Boolean isLike, Integer rateId);
    @Transactional
    @Modifying
    @Query(value = "update rate set is_deleted = true where rate.rate_id = ?;", nativeQuery = true)
    void deleteRate(Integer rateId);
}
