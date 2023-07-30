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
public class Seat {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer seatId;

    @ManyToOne
    @JoinColumn(name = "seatRowId")
    private SeatRow seatRow;

    @ManyToOne
    @JoinColumn(name = "seatColumnId")
    private SeatColumn seatColumn;

    @ManyToOne
    @JoinColumn(name = "seatTypeId")
    private SeatType seatType;

    @ManyToOne
    @JoinColumn(name="room_id")
    private Room room;

    @OneToMany(mappedBy = "bookingId")
    @JsonIgnore
    private List<Booking> bookingList;

    public Seat(Integer seatId) {
        this.seatId = seatId;
    }

    public Seat(SeatRow seatRow, SeatColumn seatColumn) {
        this.seatRow = seatRow;
        this.seatColumn = seatColumn;
    }

    public Seat(Room room, SeatColumn seatColumn, SeatRow seatRow, SeatType seatType) {
        this.seatRow = seatRow;
        this.seatColumn = seatColumn;
        this.seatType = seatType;
        this.room = room;
    }
}
