package com.example.mephim.service;

import com.example.mephim.entity.Ticket;
import com.example.mephim.exception.ShowConflictBySameMovieInTimeException;
import com.example.mephim.exception.ShowConflictBySameRoomException;
import com.example.mephim.request.TicketCreateDto;

import java.util.List;

public interface TicketService {
    List<Ticket> findAll();
    Ticket findById(Integer ticketId);
    List<Ticket> findTicketByMovie(String movieName);
    Ticket findTicketByShowDateAndShowTime(Integer showDateId, Integer showTimeId);
    Ticket findTicketByMovieIdAndShowDateIdAndShowTimeId(Integer movieId, Integer showDateId, Integer showTimeId);
    Ticket save(TicketCreateDto ticketCreateDto) throws ShowConflictBySameMovieInTimeException, ShowConflictBySameRoomException;
    Boolean deleteTicket(Integer ticketId);
}
