package com.example.mephim.request;

import lombok.Data;

import java.util.List;

@Data
public class BookingDto {
    private String user;
    private List<Integer> seatIds;
    private Integer ticketId;
    private Integer pointOfUse;
}
