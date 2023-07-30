package com.example.mephim.response;

import com.example.mephim.entity.*;
import lombok.Data;

@Data
public class ShowTimeRes {
    private ShowDate showDate;
    private ShowTime showTime;
    private TicketRes ticket;
    private Room room;
    @Data
    public static class TicketRes {
        private Integer ticketId;
        private Integer ticketPrice;
        private Movie movie;
    }
}
