package com.example.mephim.service.impl;

import com.example.mephim.entity.*;
import com.example.mephim.exception.ShowConflictBySameMovieInTimeException;
import com.example.mephim.exception.ShowConflictBySameRoomException;
import com.example.mephim.repos.*;
import com.example.mephim.request.TicketCreateDto;
import com.example.mephim.response.ShowExistResponse;
import com.example.mephim.service.TicketService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

@Service
@Transactional
public class TicketServiceImpl implements TicketService {

    @Autowired
    TicketRepo ticketRepo;

    @Autowired
    ShowDateRepo showDateRepo;

    @Autowired
    ShowTimeRepo showTimeRepo;

    @Autowired
    MovieRepo movieRepo;

    @Override
    public List<Ticket> findAll() {
        return ticketRepo.findAll();
    }

    @Override
    public Ticket findById(Integer ticketId) {
        return ticketRepo.findById(ticketId).orElse(null);
    }

    @Override
    public List<Ticket> findTicketByMovie(String movieName) {
        return ticketRepo.findTicketByMovie(movieName);
    }

    @Override
    public Ticket findTicketByShowDateAndShowTime(Integer showDateId, Integer showTimeId) {
        return ticketRepo.findTicketByShowDateAndShowTime(showDateId, showTimeId);
    }

    @Override
    public Ticket findTicketByMovieIdAndShowDateIdAndShowTimeId(Integer movieId, Integer showDateId, Integer showTimeId) {
        return ticketRepo.findTicketByMovieIdAndShowDateIdAndShowTimeId(movieId, showDateId, showTimeId);
    }

    @Override
    public Ticket save(TicketCreateDto ticketCreateDto) throws ShowConflictBySameMovieInTimeException, ShowConflictBySameRoomException {
        // Get time start and time end by ticketCreateDto
        Map<String, String> timeOfShow = getTimeStartAndTimeEnd(ticketCreateDto.getShowDateId(), ticketCreateDto.getShowTimeId(), ticketCreateDto.getMovieId());
        String timeStart = timeOfShow.get("timeStart");
        String timeEnd = timeOfShow.get("timeEnd");

        // Get all information from input
        Integer movieId = ticketCreateDto.getMovieId();
        Movie movie = movieRepo.findById(movieId).orElse(null);
        Integer showDateId = ticketCreateDto.getShowDateId();
        ShowDate showDate = showDateRepo.findById(showDateId).orElse(null);
        Integer showTimeId = ticketCreateDto.getShowTimeId();
        ShowTime showTime = showTimeRepo.findById(showTimeId).orElse(null);
        Integer roomId = ticketCreateDto.getRoomId();
        Integer price = ticketCreateDto.getPrice();

        System.out.println("SIZE: " + findListShowExistByRoomAndTime(timeStart, timeEnd).size());
        // Get show is conflict with this scheduler
        List<ShowExistResponse> showExistResponseList = findListShowExistByRoomAndTime(timeStart, timeEnd);

        // If not has conflict show -> Insert new ticket
        // If it has conflict show -> Show conflict show
        if (!showExistResponseList.isEmpty()) {

            for (ShowExistResponse showExistResponse : showExistResponseList) {
                if (showExistResponse.getMovieId().equals(movieId)) {
                    throw new ShowConflictBySameMovieInTimeException(showExistResponse);
                }

                if (showExistResponse.getRoomId().equals(roomId)) {
                    throw new ShowConflictBySameRoomException(showExistResponse);
                }
            }
        }

        Ticket ticket = new Ticket();
        ticket.setTicketPrice(price);
        ticket.setMovie(movie);
        ticket.setShowDate(showDate);
        ticket.setShowTime(showTime);
        ticket.setActive(true);
        ticket.setRoom(new Room(roomId));
        ticket.setIsDeleted(false);

        return ticketRepo.save(ticket);
    }

    @Override
    public Boolean deleteTicket(Integer ticketId) {
        int numOfRecord = ticketRepo.deleteTicket(ticketId);
        return numOfRecord > 0;
    }

    public Map<String, String> getTimeStartAndTimeEnd(Integer showDateId, Integer showTimeId, Integer movieId) {
        ShowDate showDate = showDateRepo.findByShowDateId(showDateId);
        ShowTime showTime = showTimeRepo.findByShowTimeId(showTimeId);
        Movie movie = movieRepo.findMovieByMovieId(movieId);
        Date timeStart;

        // Create format date
        SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        try {
            // Parse date String -> Date
            timeStart = sf.parse(showDate.getDate() + " " + showTime.getTime());
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }

        Calendar cld = Calendar.getInstance(TimeZone.getTimeZone("Etc/GMT+7"));
        cld.setTime(timeStart);
        cld.add(Calendar.MINUTE, movie.getMovieLength());

        String timeStartStr = showDate.getDate() + " " + showTime.getTime();
        String timeEndStr = sf.format(new Date(cld.getTimeInMillis()));

        Map<String, String> timeResult = new HashMap<>();
        timeResult.put("timeStart", timeStartStr);
        timeResult.put("timeEnd", timeEndStr);

        return timeResult;
    }

    // Find all movie show in the time declared
    public List<ShowExistResponse> findListShowExistByRoomAndTime(String timeStart, String timeEnd) {
        return ticketRepo.findListShowExistByRoomAndTime(timeStart, timeEnd);
    }

    public ShowExistResponse findConflictShowExist(List<ShowExistResponse> showExistResponseList, Integer movieId, Integer roomId) {
        return showExistResponseList.stream().filter(showExistResponse -> {
            // Because one time has not existed 2 movie show same time or room
            return showExistResponse.getMovieId().equals(movieId) || showExistResponse.getRoomId().equals(roomId);
        }).findFirst().orElse(null);
    }
}
