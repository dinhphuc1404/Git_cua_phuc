package com.example.mephim.entity;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.util.List;

@Entity @Getter @Setter @NoArgsConstructor @AllArgsConstructor
public class Category {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer categoryId;
    private String categoryName;
    private String description;
    private Boolean isEnable;
    private String modifyBy;
    private String lastModify;
    private String isDeleted;

//    @OneToMany(mappedBy = "movieCategoryId")
//    @JsonManagedReference
//    private List<MovieCategory> movieCategories;

    public Category(String categoryName){
        this.categoryName = categoryName;
    }

    public Category(Integer categoryId){
        this.categoryId = categoryId;
    }
}
