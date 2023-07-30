package com.example.mephim.repos;

import com.example.mephim.entity.Room;
import com.example.mephim.response.RoomSeatRes;
import com.example.mephim.response.RoomStruct;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RoomRepo extends JpaRepository<Room, Integer> {
    @Query(value = "select distinct room.* from room inner join ticket\n" +
            "where room.room_id = ticket.room_id\n" +
            "and ticket.active=1\n" +
            "and ticket.ticket_id = ?;", nativeQuery = true)
    Room findByTicketId(Integer ticketId);
    List<Room> findAll();

    @Query(value="select * from (\n" +
            "\twith TEMP_room_seat AS (\n" +
            "\tselect seat.seat_id, concat(seat_column.column_name,seat_row.row_name) as `seat_name`, \n" +
            "\tseat_type.seat_type_name as `seat_type`, true as `is_booking` from seat inner join booking\n" +
            "\ton seat.seat_id = booking.seat_id\n" +
            "\tinner join room inner join ticket inner join seat_column inner join seat_row inner join seat_type\n" +
            "\twhere seat.room_id = room.room_id\n" +
            "\tand room.room_id = ticket.room_id\n" +
            "\tand seat.seat_row_id = seat_row.row_id\n" +
            "\tand seat.seat_column_id = seat_column.column_id\n" +
            "\tand seat.seat_type_id = seat_type.seat_type_id\n" +
            "\tand ticket.show_date_id = ?1\n" +
            "\tand ticket.show_time_id = ?2\n" +
            "\tand booking.ticket_id = ?3)\n" +
            "\tselect * from TEMP_room_seat\n" +
            "\tunion\n" +
            "\t(select seat.seat_id, concat(seat_column.column_name,seat_row.row_name) as `seat_name`,\n" +
            "\tseat_type.seat_type_name as `seat_type`, false as `is_booking` from seat\n" +
            "\tinner join room inner join ticket inner join seat_column inner join seat_row inner join seat_type\n" +
            "\twhere seat.room_id = room.room_id\n" +
            "\tand room.room_id = ticket.room_id\n" +
            "\tand seat.seat_row_id = seat_row.row_id\n" +
            "\tand seat.seat_column_id = seat_column.column_id\n" +
            "\tand seat.seat_type_id = seat_type.seat_type_id\n" +
            "\tand ticket.show_date_id = ?1\n" +
            "\tand ticket.show_time_id = ?2\n" +
            "\tand ticket.ticket_id = ?3\n" +
            "\tand seat.seat_id not in (select TEMP_room_seat.seat_id from TEMP_room_seat))) as a\n" +
            "\torder by a.seat_id asc;", nativeQuery = true)
    List<RoomSeatRes> findRoomSeatByShowDateAndShowTimeTicket(Integer showDateId, Integer showTimeId, Integer ticketId);

    @Query(value = "select * from room where room.room_id = ?;", nativeQuery = true)
    RoomStruct getRoomStruct(Integer roomId);

    @Query(value = "select * from room where room.room_id = ? and room.is_enable = true;", nativeQuery = true)
    Room findByRoomId(Integer roomId);
}
