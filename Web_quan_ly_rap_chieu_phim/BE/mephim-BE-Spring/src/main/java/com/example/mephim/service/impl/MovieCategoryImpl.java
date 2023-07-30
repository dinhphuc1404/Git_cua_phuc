package com.example.mephim.service.impl;

import com.example.mephim.entity.MovieCategory;
import com.example.mephim.repos.MovieCategoryRepo;
import com.example.mephim.service.MovieCategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service @Transactional
public class MovieCategoryImpl implements MovieCategoryService {
    @Autowired
    MovieCategoryRepo movieCategoryRepo;
    @Override
    public void save(MovieCategory movieCategory) {
        movieCategoryRepo.save(movieCategory);
    }

    @Override
    public Boolean deleteAllCategory(Integer movieId) {
        return movieCategoryRepo.deleteAllCategory(movieId) > 0;
    }
}
