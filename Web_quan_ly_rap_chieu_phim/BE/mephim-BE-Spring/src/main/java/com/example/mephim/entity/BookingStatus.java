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
public class BookingStatus {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer bookingStatusId;

    private String bookingStatus;

    @OneToMany(mappedBy = "bookingId")
    @JsonIgnore
    private List<Booking> bookingList;

    public BookingStatus(Integer bookingStatusId) {
        this.bookingStatusId = bookingStatusId;
    }

}
