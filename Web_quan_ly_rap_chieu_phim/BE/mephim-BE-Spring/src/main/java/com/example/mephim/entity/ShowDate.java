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
public class ShowDate {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer showDateId;

    @Column(name = "date", columnDefinition = "DATE")
    private String date;

    @OneToMany(mappedBy = "ticketId")
    @JsonIgnore
    private List<Ticket> ticketList;

    public ShowDate(String date) {
        this.date = date;
    }
}
