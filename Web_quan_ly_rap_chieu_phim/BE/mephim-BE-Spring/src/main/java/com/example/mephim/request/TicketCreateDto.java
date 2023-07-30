package com.example.mephim.request;

import lombok.Data;

@Data
public class TicketCreateDto {
    private Integer showDateId;
    private Integer showTimeId;
    private Integer movieId;
    private Integer roomId;
    private Integer price;
}
