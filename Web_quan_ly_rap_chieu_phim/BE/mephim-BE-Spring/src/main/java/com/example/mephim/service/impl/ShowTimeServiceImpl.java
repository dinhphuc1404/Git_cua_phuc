package com.example.mephim.service.impl;

import com.example.mephim.entity.Room;
import com.example.mephim.entity.ShowTime;
import com.example.mephim.entity.Ticket;
import com.example.mephim.repos.ShowTimeRepo;
import com.example.mephim.response.ShowTimeRes;
import com.example.mephim.service.RoomService;
import com.example.mephim.service.ShowDateService;
import com.example.mephim.service.ShowTimeService;
import com.example.mephim.service.TicketService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class ShowTimeServiceImpl implements ShowTimeService {

    @Autowired
    ShowTimeRepo showTimeRepo;

    @Autowired
    ShowDateService showDateService;
    @Autowired
    TicketService ticketService;

    @Autowired
    RoomService roomService;

    @Override
    public List<ShowTime> findAll() {
        return showTimeRepo.findAll();
    }

    @Override
    public List<ShowTimeRes> findTicketByMovieIdAndShowDateIdAndShowTimeId(Integer movieId, Integer showDateId) {
        List<ShowTimeRes> resList = new ArrayList<>();
        List<ShowTime> showTimes = showTimeRepo.findShowTimeByShowDate(movieId,showDateId);

        showTimes.forEach(showTime -> {
            ShowTimeRes res = new ShowTimeRes();
            res.setShowDate(showDateService.findShowDateById(showDateId));
            res.setShowTime(showTime);

            Ticket ticket = ticketService.findTicketByMovieIdAndShowDateIdAndShowTimeId(movieId,showDateId,showTime.getShowTimeId());
            Room room = roomService.findByTicketId(ticket.getTicketId());
            ShowTimeRes.TicketRes ticketRes = new ShowTimeRes.TicketRes();
            ticketRes.setTicketId(ticket.getTicketId());
            ticketRes.setTicketPrice(ticket.getTicketPrice());
            ticketRes.setMovie(ticket.getMovie());

            res.setTicket(ticketRes);
            res.setRoom(room);

            resList.add(res);
        });

        return resList;
    }
}
