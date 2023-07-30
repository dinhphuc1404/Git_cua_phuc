package com.example.mephim.exception;

public class UserNotFoundException extends Exception{

    private static final String message = "user not found";
    public UserNotFoundException() {
        super(message);
    }
}
