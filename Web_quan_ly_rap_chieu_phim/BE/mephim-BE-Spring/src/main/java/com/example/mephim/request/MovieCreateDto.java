package com.example.mephim.request;

import lombok.Data;

import javax.validation.constraints.Null;
import java.util.List;

@Data
public class MovieCreateDto {
    @Null
    private Integer movieId;
    private String movieName;
    private String movieDirector;
    private String movieActor;
    private Integer movieLength;
    private String movieTrailerUrl;
    private String moviePoster;
    private String movieDescription;
    private List<Integer> movieCategoryIds;
}
