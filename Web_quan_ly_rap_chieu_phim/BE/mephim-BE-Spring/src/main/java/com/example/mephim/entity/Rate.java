package com.example.mephim.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Table(uniqueConstraints = {
        @UniqueConstraint(name = "UniqueUserAndMovie", columnNames = {"userId", "movieId", "isDeleted"}),
})
public class Rate {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer rateId;
    @ManyToOne
    @JoinColumn(name = "movieId")
    private Movie movie;
    @ManyToOne
    @JoinColumn(name = "userId")
    private User user;
    private Double numRate;
    private String content;
    private Boolean isLiked;
    private Boolean isDeleted;
}
