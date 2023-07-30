package com.example.mephim.exception;

public class ShowConflictBySameRoomException extends Exception{
    private Object data;
    private static final String ERROR_MESSAGE = "The room has a movie show in this time";
    public ShowConflictBySameRoomException() {
        super(ERROR_MESSAGE);
    }
    public ShowConflictBySameRoomException(Object data) {
        super(ERROR_MESSAGE);
        this.data = data;
    }

    public Object getData() {
        return this.data;
    }
}
