package com.example.mephim.service;

import com.example.mephim.entity.Booking;
import com.example.mephim.exception.InvalidParamException;
import com.example.mephim.exception.SeatIsBookedException;
import com.example.mephim.request.BookingDto;
import com.example.mephim.entity.Movie;
import com.example.mephim.response.BookedResponse;

import java.util.List;

public interface BookingService {
    List<Movie> findAllBooking();
    Booking findBookingByRoomSeatAndTicket(Integer roomSeatId, Integer ticketId);
    BookedResponse saveBooking(BookingDto bookingDto) throws InvalidParamException, SeatIsBookedException;
}
