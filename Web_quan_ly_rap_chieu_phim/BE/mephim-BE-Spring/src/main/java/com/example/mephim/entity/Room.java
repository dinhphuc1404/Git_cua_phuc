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
public class Room {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer roomId;
    private String roomName;
    private Integer totalRow;
    private Integer totalColumn;
    private String rowVIP;
    private Boolean isEnable;
    private String modifyBy;
    private String lastModify;
    private String isDeleted;

    @OneToMany(mappedBy = "seatId")
    @JsonIgnore
    private List<Seat> seatList;

    @OneToMany(mappedBy = "ticketId")
    @JsonIgnore
    private List<Ticket> ticketList;

    public Room(Integer roomId) {
        this.roomId = roomId;
    }

    public Room(String roomName) {
        this.roomName = roomName;
    }
}
