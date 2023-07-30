package com.example.mephim.repos;

import com.example.mephim.entity.Category;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CategoryRepo extends JpaRepository<Category, Integer> {
    @Query(value="select category.* from category inner join movie inner join movie_category \n" +
            "where movie.movie_id = movie_category.movie_id\n" +
            "and category.category_id = movie_category.category_id\n" +
            "and movie.movie_id = ?;", nativeQuery = true)
    List<Category> findByMovie(Integer movieId);
}
