package com.example.mephim.entity;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.util.List;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class SeatType {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer seatTypeId;

    private String seatTypeName;

    @OneToMany(mappedBy = "seatId")
    @JsonIgnore
    private List<Seat> seatList;

    public SeatType(Integer seatTypeId) {
        this.seatTypeId = seatTypeId;
    }

    public SeatType(String seatTypeName) {
        this.seatTypeName = seatTypeName;
    }
}
