package com.example.mephim;

import com.example.mephim.constants.Constants;
import com.example.mephim.entity.*;
import com.example.mephim.service.CommonService;
import com.example.mephim.service.SeatService;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Calendar;
import java.util.TimeZone;

@SpringBootApplication
public class MephimApplication {

    public static void main(String[] args) {
        SpringApplication.run(MephimApplication.class, args);
    }

    @Bean
    CommandLineRunner run() {
        return args -> {
            SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
            Calendar cld = Calendar.getInstance(TimeZone.getTimeZone("Etc/GMT+7"));
            cld.setTime(sf.parse("2022-12-19 07:00"));
            cld.add(Calendar.MINUTE, 120);
            System.out.println(cld);
        };
    }

    // ADMIN ADD DATA
//    @Bean
    CommandLineRunner run(CommonService commonService, SeatService seatService) {
        return args -> {
//            Arrays.asList(Constants.ROOM_LIST).forEach((item) -> {
//                commonService.initialRoom(new Room(item));
//            });
//
//            Arrays.asList(Constants.SEAT_ROW_LIST).forEach((item) -> {
//                commonService.initialSeatRow(new SeatRow(item));
//            });
//
//            Arrays.asList(Constants.SEAT_COLUMN_LIST).forEach((item) -> {
//                commonService.initialSeatColumn(new SeatColumn(item));
//            });
//
//            Arrays.asList(Constants.SEAT_TYPE_LIST).forEach((item) -> {
//                commonService.initialSeatType(new SeatType(item));
//            });
//
//            Arrays.asList(Constants.SHOW_DATE_LIST).forEach((item) -> {
//                commonService.initialShowDate(new ShowDate(item));
//            });
//
//            Arrays.asList(Constants.SHOW_TIME_LIST).forEach((item) -> {
//                commonService.initialShowTime(new ShowTime(item));
//            });
//
//            Arrays.asList(Constants.CATEGORY_LIST).forEach((item) -> {
//                commonService.initialCategory(new Category(item));
//            });
//
//            Arrays.asList(Constants.ACTOR_LIST).forEach((item) -> {
//                commonService.initialActor(new Actor(item));
//            });
//
//            Arrays.asList(Constants.THEATER_GROUP_LIST).forEach((item) -> {
//                commonService.initialTheaterGroup(new TheaterGroup(item));
//            });

            for (int i = 1; i <= 4; i++) {
                for (int j = 1; j <= 4; j++) {
                    Seat seat;
//                    if(i>9) {
//                        seat = new Seat(new Room(2), new SeatColumn(i), new SeatRow(j), new SeatType(2));
//                    } else {
                        seat = new Seat(new Room(3), new SeatColumn(i), new SeatRow(j), new SeatType(1));
//                    }
                    seatService.save(seat);
                }
            }

            // length of roomList = 5
//            for (int i = 1; i <= 5; i++) {
//                for (int j = 1; j <= 100; j++) {
//                    if (j >= 90) commonService.initialRoomSeat(i, j, 2);
//                    else commonService.initialRoomSeat(i, j, 1);
//                }
//            }
        };
    }

}
