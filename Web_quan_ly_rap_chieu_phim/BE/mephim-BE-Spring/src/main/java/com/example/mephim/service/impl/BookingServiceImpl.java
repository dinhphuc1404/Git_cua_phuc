package com.example.mephim.service.impl;

import com.example.mephim.exception.InvalidParamException;
import com.example.mephim.exception.SeatIsBookedException;
import com.example.mephim.repos.UserRepository;
import com.example.mephim.request.BookingDto;
import com.example.mephim.entity.*;
import com.example.mephim.repos.BookingRepo;
import com.example.mephim.response.BookedResponse;
import com.example.mephim.service.*;
import com.example.mephim.ultils.MailSender;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import javax.mail.MessagingException;
import javax.transaction.Transactional;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import org.apache.commons.lang3.StringUtils;

@Service
@Transactional
public class BookingServiceImpl implements BookingService {
    @Autowired
    BookingRepo bookingRepo;
    @Autowired
    RoomServiceImpl roomService;
    @Autowired
    SeatService seatService;
    @Autowired
    UserRepository userRepository;
    @Autowired
    TicketService ticketService;
    @Autowired
    MailSender mailSender;

    @Override
    public List<Movie> findAllBooking() {
        return null;
    }

    @Override
    public Booking findBookingByRoomSeatAndTicket(Integer roomSeatId, Integer ticketId) {
        return bookingRepo.findBookingByRoomSeatAndTicket(roomSeatId, ticketId);
    }

    @Transactional
    @Override
    public BookedResponse saveBooking(BookingDto bookingDto) throws InvalidParamException, SeatIsBookedException {
        BookedResponse bookedResponse = new BookedResponse();
        for (int i = 0; i < bookingDto.getSeatIds().size(); i++) {
            // If seat and user is not exist of seat is booked, throw exception
            Booking bookedBySeat = findBookingByRoomSeatAndTicket(bookingDto.getSeatIds().get(i), bookingDto.getTicketId());
            if (bookedBySeat != null) throw new SeatIsBookedException();

            User user = userRepository.findByUsername(bookingDto.getUser())
                    .orElseThrow(() -> new UsernameNotFoundException("User Not Found with username: " + bookingDto.getUser()));

            Seat seat = seatService.findSeatByTicketIdAndSeatId(bookingDto.getTicketId(), bookingDto.getSeatIds().get(i));
            if (seat == null) throw new InvalidParamException();
            // Find room by seat
            Room room = seat.getRoom();

            Ticket ticket = ticketService.findById(bookingDto.getTicketId());
            if (ticket == null) throw new InvalidParamException();
            if(bookedResponse.getMovieName() == null) {
                bookedResponse.setMovieName(ticket.getMovie().getMovieName());
            }

            Integer pointOfUse = bookingDto.getPointOfUse();
            if(pointOfUse == null) pointOfUse = 0;

            // rewardPoint is 10% ticket price
            int rewardPoint = ticket.getTicketPrice() * 10/100;
            Integer pointToUpdate = pointOfUse > 0 ? -pointOfUse : rewardPoint;

            Booking booking = new Booking();
            booking.setUser(user);
            booking.setSeat(seat);
            booking.setTicket(ticket);
            booking.setBookingStatus(new BookingStatus(1));
            booking.setTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date()));
            booking.setPointOfUse(pointOfUse);
            booking.setRewardPoint(pointToUpdate);

            Booking bookingSaved = bookingRepo.save(booking);

            // increase point for user
            userRepository.increasePoint(pointToUpdate, user.getUsername());

            // Create model to response client know result and make mail result send to user
            if(bookedResponse.getListBookingIds() == null) {
                bookedResponse.setListBookingIds(Collections.singletonList(bookingSaved.getBookingId()));
            } else {
                List<Integer> bookingIds = new ArrayList<>(bookedResponse.getListBookingIds());
                bookingIds.add(bookingSaved.getBookingId());
                bookedResponse.setListBookingIds(bookingIds);
            }

            // Seat save format like 1A, 2B
            if(bookedResponse.getListSeats() == null) {
                bookedResponse.setListSeats(Collections.singletonList(bookingSaved.getSeat().getSeatColumn().getColumnName() + "" + bookingSaved.getSeat().getSeatRow().getRowName()));
            } else {
                List<String> seatIds = new ArrayList<>(bookedResponse.getListSeats());
                seatIds.add(bookingSaved.getSeat().getSeatColumn().getColumnName() + "" + bookingSaved.getSeat().getSeatRow().getRowName());
                bookedResponse.setListSeats(seatIds);
            }
            bookedResponse.setPrice(bookedResponse.getPrice() + ticket.getTicketPrice());
            bookedResponse.setRoom(room.getRoomName());
            bookedResponse.setTimeOrder(bookingSaved.getTime());
            bookedResponse.setShowTime(bookingSaved.getTicket().getShowDate().getDate() + " " + bookingSaved.getTicket().getShowTime().getTime());
        }

        sendResult(bookingDto.getUser(), bookedResponse);

        return bookedResponse;
    }
    public void sendResult(String email, BookedResponse response) {
        try {
            mailSender.send(email, "THÔNG TIN ĐẶT VÉ XEM PHIM", "Thông tin đặt vé: " + "</br>" +
                    "- Phim: " +  response.getMovieName() + "</br>" +
                    "- Mã vé: " + StringUtils.join(response.getListBookingIds(), ',') + "</br>" +
                    "- Số ghế: " + StringUtils.join(response.getListSeats(), ',') + "</br>" +
                    "- Thành tiền: " + response.getPrice() + " VND " + "</br>" +
                    "- Giờ đặt vé: " + response.getTimeOrder() + "</br>" +
                    "- Giờ chiếu: " + response.getShowTime() + "</br>" +
                    "- Phòng chiếu: " + response.getRoom() + "</br>");
        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }
}
