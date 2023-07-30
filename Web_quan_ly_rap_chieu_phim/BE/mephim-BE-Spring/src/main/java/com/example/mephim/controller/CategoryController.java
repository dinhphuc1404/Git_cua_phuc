package com.example.mephim.controller;

import com.example.mephim.entity.Category;
import com.example.mephim.entity.Movie;
import com.example.mephim.request.SaveCategoryDto;
import com.example.mephim.response.CustomResponse;
import com.example.mephim.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/category")
@CrossOrigin("*")
public class CategoryController {
    @Autowired
    CategoryService categoryService;

    @GetMapping("/list-category")
    public ResponseEntity<?> listCategory() {
        List<Category> categoryList = categoryService.findAll();
        if(categoryList.isEmpty()) return new ResponseEntity<>(new CustomResponse<>(10, "data is empty"), HttpStatus.OK);
        return new ResponseEntity<>(new CustomResponse<>(10,categoryList), HttpStatus.OK);
    }

    @PostMapping("/add-category")
    public ResponseEntity<?> addCategory(@RequestBody SaveCategoryDto categoryDto) {
        categoryService.addCategory(categoryDto);
        return new ResponseEntity<>(new CustomResponse<>(10,"OK"), HttpStatus.OK);
    }
}
