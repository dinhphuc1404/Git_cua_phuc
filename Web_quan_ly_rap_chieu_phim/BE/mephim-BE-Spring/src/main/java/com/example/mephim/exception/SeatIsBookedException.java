package com.example.mephim.exception;

public class SeatIsBookedException extends Exception{
    private static final String ERROR_MESSAGE = "This seat is booked";
    public SeatIsBookedException() {
        super(ERROR_MESSAGE);
    }
}
