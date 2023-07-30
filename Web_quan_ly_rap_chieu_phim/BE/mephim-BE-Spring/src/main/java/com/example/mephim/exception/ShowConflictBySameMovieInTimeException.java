package com.example.mephim.exception;

public class ShowConflictBySameMovieInTimeException extends Exception{

    private Object data;
    private static final String ERROR_MESSAGE = "This movie is showed in the room or another room (1 movie has 1 room in the time)";
    public ShowConflictBySameMovieInTimeException() {
        super(ERROR_MESSAGE);
    }
    public ShowConflictBySameMovieInTimeException(Object data) {
        super(ERROR_MESSAGE);
        this.data = data;
    }
    public Object getData() {
        return this.data;
    }
}
