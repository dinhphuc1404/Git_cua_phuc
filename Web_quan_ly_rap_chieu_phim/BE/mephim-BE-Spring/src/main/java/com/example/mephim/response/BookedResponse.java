package com.example.mephim.response;

import lombok.Data;

import java.util.ArrayList;
import java.util.List;

@Data
public class BookedResponse {
    private String movieName;
    private List<Integer> listBookingIds;
    private List<String> listSeats;
    private String timeOrder;
    private String room;
    private String showTime;
    private double price;
}
