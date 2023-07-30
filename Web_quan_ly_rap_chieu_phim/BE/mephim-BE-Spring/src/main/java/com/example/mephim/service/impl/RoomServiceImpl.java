package com.example.mephim.service.impl;

import com.example.mephim.entity.*;
import com.example.mephim.repos.RoomRepo;
import com.example.mephim.request.SaveRoomDto;
import com.example.mephim.request.RoomEditDto;
import com.example.mephim.response.RoomSeatRes;
import com.example.mephim.response.RoomStruct;
import com.example.mephim.service.RoomService;
import com.example.mephim.service.SeatService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;

@Service
@Transactional
public class RoomServiceImpl implements RoomService {
    @Autowired
    RoomRepo roomRepo;

    @Autowired
    SeatService seatService;

    @Transactional
    @Override
    public Room save(SaveRoomDto roomDto) {

        Room room = new Room();

        if (roomDto.getId() != null) {
            deleteAllSeatOnRoom(roomDto.getId());
            room.setRoomId(roomDto.getId());
        }

        // i-1 because index of row in the FE start with 0
        List<Integer> rowVipConverter = roomDto.getRowVIP().stream().map(integer -> integer + 1).sorted().collect(Collectors.toList());

        room.setRoomName(roomDto.getName());
        room.setTotalRow(roomDto.getHeight());
        room.setTotalColumn(roomDto.getWidth());
        room.setRowVIP(rowVipConverter.stream().map(Object::toString)
                .collect(Collectors.joining("-")));
        room.setIsEnable(true);

        Room savedRoom = roomRepo.save(room);
        saveSeatForRoom(room.getRoomId(), savedRoom.getTotalColumn(), savedRoom.getTotalRow(), rowVipConverter);
        return savedRoom;
    }

    @Override
    @Transactional
    public Room edit(RoomEditDto roomDto) {
        deleteAllSeatOnRoom(roomDto.getRoomId());
        Room room = new Room();
        room.setRoomName(roomDto.getName());
        room.setTotalRow(roomDto.getHeight());
        room.setTotalColumn(roomDto.getWidth());
        room.setIsEnable(true);

        Room savedRoom = roomRepo.save(room);
        saveSeatForRoom(room.getRoomId(), savedRoom.getTotalColumn(), savedRoom.getTotalRow(), roomDto.getRowVIP());
        return savedRoom;
    }

    @Override
    public Room detail(Integer roomId) {
        return roomRepo.findById(roomId).orElse(null);
    }

    void deleteAllSeatOnRoom(Integer roomId) {
        seatService.deleteAllSeatByRoom(roomId);
    }

    void saveSeatForRoom(int roomId, int width, int height, List<Integer> rowVIP) {
        for (int i = 1; i <= height; i++) {
            for (int j = 1; j <= width; j++) {
                Seat seat;
                if (rowVIP.contains(i)) {
                    seat = new Seat(new Room(roomId), new SeatColumn(i), new SeatRow(j), new SeatType(2));

                } else {
                    seat = new Seat(new Room(roomId), new SeatColumn(i), new SeatRow(j), new SeatType(1));

                }
                seatService.save(seat);
            }
        }
    }

    @Override
    public List<Room> findAll() {
        return roomRepo.findAll();
    }

    @Override
    public Room findByTicketId(Integer ticketId) {
        return roomRepo.findByTicketId(ticketId);
    }

    @Override
    public Room findByRoomId(Integer roomId) {
        return roomRepo.findById(roomId).orElse(null);
    }

    @Override
    public List<RoomSeatRes> findRoomSeatByShowDateAndShowTimeTicket(Integer showDateId, Integer showTimeId, Integer ticketId) {
        return roomRepo.findRoomSeatByShowDateAndShowTimeTicket(showDateId, showTimeId, ticketId);
    }

    @Override
    public RoomStruct getRoomStruct(Integer roomId) {
        return roomRepo.getRoomStruct(roomId);
    }
}
