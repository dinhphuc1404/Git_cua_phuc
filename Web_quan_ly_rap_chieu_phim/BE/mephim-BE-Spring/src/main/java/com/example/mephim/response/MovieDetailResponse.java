package com.example.mephim.response;

import com.example.mephim.entity.Category;
import com.example.mephim.entity.Movie;
import lombok.Data;

import java.util.List;

@Data
public class MovieDetailResponse {
    private Movie movie;
    private List<Category> categoryList;
}
