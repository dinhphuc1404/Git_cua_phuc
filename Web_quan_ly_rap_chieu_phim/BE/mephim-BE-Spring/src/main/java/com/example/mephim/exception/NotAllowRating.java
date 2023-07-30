package com.example.mephim.exception;

public class NotAllowRating extends Exception{
    private static final String ERROR_MESSAGE = "Rating is not allow";
    public NotAllowRating() {
        super(ERROR_MESSAGE);
    }
}
