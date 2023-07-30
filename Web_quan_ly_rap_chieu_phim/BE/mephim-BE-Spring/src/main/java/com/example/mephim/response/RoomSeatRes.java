package com.example.mephim.response;

import lombok.Data;
import org.springframework.beans.factory.annotation.Value;

public interface RoomSeatRes {
    @Value("#{target.seat_id}")
    Integer getSeatId();
    @Value("#{target.seat_name}")
    String getSeatName();
    @Value("#{target.seat_type}")
    String getSeatType();
    @Value("#{target.is_booking}")
    Integer getIsBooking();
}
