//package com.example.mephim.repos;
//
//import com.example.mephim.entity.RoomSeat;
//import com.example.mephim.response.RoomSeatRes;
//import org.springframework.data.jpa.repository.JpaRepository;
//import org.springframework.data.jpa.repository.Query;
//import org.springframework.stereotype.Repository;
//
//import java.util.List;
//
//@Repository
//public interface RoomSeatRepo extends JpaRepository<RoomSeat, Integer> {
//    @Query(value = "select booking.* from booking " +
//            "inner join ticket " +
//            "inner join booking_status " +
//            "where ticket.ticket_id = booking.ticket_id " +
//            "and booking_status.booking_status_id=1 " +
//            "and ticket.active=1\n" +
//            "and booking.ticket_id=?", nativeQuery = true)
//    RoomSeat findByTicketId(Integer ticketId);
//
//    @Query(value="select * from (\n" +
//            "with TEMP_room_seat AS (\n" +
//            "select room_seat.room_seat_id, concat(seat_column.column_name,seat_row.row_name) as `seat_name`, seat_type.seat_type_name as `seat_type`, true as `is_booking` from room_seat inner join booking\n" +
//            "on room_seat.room_seat_id = booking.room_seat_id\n" +
//            "inner join room inner join room_ticket inner join ticket  inner join seat inner join seat_column inner join seat_row inner join seat_type\n" +
//            "where room_seat.room_id = room.room_id\n" +
//            "and room.room_id = room_ticket.room_id\n" +
//            "and room_ticket.ticket_id = ticket.ticket_id\n" +
//            "and room_seat.seat_id = seat.seat_id\n" +
//            "and seat.seat_row_id = seat_row.row_id\n" +
//            "and seat.seat_column_id = seat_column.column_id\n" +
//            "and room_seat.seat_type_id = seat_type.seat_type_id\n" +
//            "and ticket.show_date_id=?1\n" +
//            "and ticket.show_time_id=?2\n" +
//            "and booking.ticket_id = ?3)\n" +
//            "select * from TEMP_room_seat\n" +
//            "union\n" +
//            "(select room_seat.room_seat_id, concat(seat_column.column_name,seat_row.row_name) as `seat_name`, seat_type.seat_type_name as `seat_type`, false as `is_booking` from room_seat\n" +
//            "inner join room inner join room_ticket inner join ticket inner join seat inner join seat_column inner join seat_row inner join seat_type\n" +
//            "where room_seat.room_id = room.room_id\n" +
//            "and room.room_id = room_ticket.room_id\n" +
//            "and room_ticket.ticket_id = ticket.ticket_id\n" +
//            "and room_seat.seat_id = seat.seat_id\n" +
//            "and seat.seat_row_id = seat_row.row_id\n" +
//            "and seat.seat_column_id = seat_column.column_id\n" +
//            "and room_seat.seat_type_id = seat_type.seat_type_id\n" +
//            "and ticket.show_date_id=?1\n" +
//            "and ticket.show_time_id=?2\n" +
//            "and ticket.ticket_id = ?3\n" +
//            "and room_seat.room_seat_id not in (select TEMP_room_seat.room_seat_id from TEMP_room_seat))) as a\n" +
//            "order by a.room_seat_id asc;", nativeQuery = true)
//    List<RoomSeatRes> findRoomSeatByShowDateAndShowTimeTicket(Integer showDateId, Integer showTimeId, Integer ticketId);
//}
