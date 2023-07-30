package com.example.mephim.service;

import com.example.mephim.entity.Category;
import com.example.mephim.request.SaveCategoryDto;

import java.util.List;

public interface CategoryService {
    List<Category> findAll();
    List<Category> findByMovie(Integer movieId);
    void addCategory(SaveCategoryDto categoryDto);
}
