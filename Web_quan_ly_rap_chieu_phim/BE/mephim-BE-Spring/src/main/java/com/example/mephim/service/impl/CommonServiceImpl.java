package com.example.mephim.service.impl;

import com.example.mephim.entity.*;
import com.example.mephim.repos.*;
import com.example.mephim.service.CommonService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service @Transactional @Slf4j
public class CommonServiceImpl implements CommonService {

    @Autowired
    SeatRepo seatRepo;

//    @Autowired
//    RoomSeatRepo roomSeatRepo;

    @Autowired
    SeatTypeRepo seatTypeRepo;

    @Autowired
    SeatColumnRepo seatColumnRepo;

    @Autowired
    SeatRowRepo seatRowRepo;

    @Autowired
    ShowDateRepo showDateRepo;

    @Autowired
    ShowTimeRepo showTimeRepo;

    @Autowired
    CategoryRepo categoryRepo;

    @Autowired
    RoomRepo roomRepo;

    @Override
    public void initialSeatColumn(SeatColumn seatColumn) {
        log.info("Saves seat column to the database: " + seatColumn.getColumnName());
        seatColumnRepo.save(seatColumn);
    }

    @Override
    public void initialSeatRow(SeatRow seatRow) {
        log.info("Saves seat row to the database: " + seatRow.getRowName());
        seatRowRepo.save(seatRow);
    }

    @Override
    public void initialSeatType(SeatType seatType) {
        log.info("Saves seat type to the database: " + seatType.getSeatTypeName());
        seatTypeRepo.save(seatType);
    }

    @Override
    public void initialShowDate(ShowDate showDate) {
        log.info("Saves showDate to the database: " + showDate.getDate());
        showDateRepo.save(showDate);
    }

    @Override
    public void initialShowTime(ShowTime showTime) {
        log.info("Saves showTime to the database: " + showTime.getTime());
        showTimeRepo.save(showTime);
    }

    @Override
    public void initialCategory(Category category) {
        log.info("Saves category to the database: " + category.getCategoryName());
        categoryRepo.save(category);
    }

    @Override
    public void initialRoom(Room room) {
        log.info("Saves room to the database: " + room.getRoomName());
        roomRepo.save(room);
    }

    @Override
    public void initialSeat(Integer roomId, Integer seatColumnId, Integer seatRowId) {
        log.info("Saves seat to the database: " + seatColumnId + "; "+ seatRowId);
        SeatColumn seatColumn = seatColumnRepo.findById(seatColumnId).orElse(null);
        SeatRow seatRow = seatRowRepo.findById(seatRowId).orElse(null);
        seatRepo.save(new Seat(seatRow,seatColumn));
    }

    @Override
    public void initialRoomSeat(Integer roomId, Integer seatId, Integer seatTypeId) {
        log.info("Saves roomSeat to the database: " + roomId + "; "+ seatId);
        Room room = roomRepo.findById(roomId).orElse(null);
        Seat seat = seatRepo.findById(seatId).orElse(null);
//        roomSeatRepo.save(new RoomSeat(room,seat,new SeatType(seatTypeId)));
    }

    @Override
    public ShowDate findShowDateById(Integer id) {
        return showDateRepo.findById(id).orElse(null);
    }

    @Override
    public ShowTime findShowTimeById(Integer id) {
        return showTimeRepo.findById(id).orElse(null);
    }

    @Override
    public Category findCategoryById(Integer id) {
        return categoryRepo.findById(id).orElse(null);
    }
}
