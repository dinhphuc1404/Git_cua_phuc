select show_date.* from show_date 
inner join ticket 
inner join movie 
where show_date.show_date_id = ticket.ticket_id 
and movie.movie_id = ticket.movie_id
and movie.movie_id = 1;

select show_time.* from show_time inner join ticket inner join movie inner join show_date
where show_time.show_time_id = ticket.show_time_id
and ticket.show_date_id = show_date.show_date_id
and ticket.movie_id = movie.movie_id
and ticket.movie_id = 1
and ticket.show_date_id = 5;

select ticket.* from ticket inner join show_date inner join show_time
where ticket.show_date_id = show_date.show_date_id
and ticket.show_time_id = show_time.show_time_id
and ticket.show_date_id = 1
and ticket.show_time_id = 9;

select room_seat.*, booking.booking_id from room_seat inner join room inner join room_ticket left join booking
on booking.room_seat_id = room_seat.room_seat_id
where room_seat.room_id = room.room_id
and room.room_id = room_ticket.room_id
-- and booking.booking_id is null
and room_ticket.ticket_id = 2
and room_seat.room_id = 5;



select distinct show_date.* from show_date inner join ticket inner join movie inner join movie_theater
where show_date.show_date_id = ticket.show_date_id
  and movie.movie_id = ticket.movie_id
  and movie_theater.movie_id = movie.movie_id
  and movie_theater.theater_id = 1;