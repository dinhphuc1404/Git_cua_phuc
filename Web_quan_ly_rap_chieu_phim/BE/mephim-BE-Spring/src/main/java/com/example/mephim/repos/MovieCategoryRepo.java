package com.example.mephim.repos;

import com.example.mephim.entity.MovieCategory;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public interface MovieCategoryRepo extends JpaRepository<MovieCategory, Integer> {
    @Transactional
    @Modifying
    @Query(value = "delete from movie_category where movie_category.movie_id = ?;", nativeQuery = true)
    int deleteAllCategory(Integer movieId);
}
