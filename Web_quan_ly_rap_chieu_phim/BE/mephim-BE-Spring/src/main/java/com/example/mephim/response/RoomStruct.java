package com.example.mephim.response;

import org.springframework.beans.factory.annotation.Value;

public interface RoomStruct {
    @Value("#{target.room_id}")
    Integer getRoomId();
    @Value("#{target.room_name}")
    String getRoomName();
    @Value("#{target.total_row}")
    Integer getTotalRow();
    @Value("#{target.total_column}")
    Integer getTotalColumn();
}
