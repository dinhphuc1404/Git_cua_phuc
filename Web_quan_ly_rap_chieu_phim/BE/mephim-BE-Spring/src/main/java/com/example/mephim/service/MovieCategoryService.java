package com.example.mephim.service;

import com.example.mephim.entity.MovieCategory;

public interface MovieCategoryService {
    void save(MovieCategory movieCategory);
    Boolean deleteAllCategory(Integer movieId);
}
