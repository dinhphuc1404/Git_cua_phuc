package com.example.mephim.exception;

public class InvalidParamException extends Exception{
    private static final String ERROR_MESSAGE = "Invalid param";
    public InvalidParamException() {
        super(ERROR_MESSAGE);
    }
}
