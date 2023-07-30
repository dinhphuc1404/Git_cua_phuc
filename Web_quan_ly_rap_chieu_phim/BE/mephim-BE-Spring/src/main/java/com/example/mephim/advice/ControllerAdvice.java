package com.example.mephim.advice;

import com.example.mephim.exception.NotAllowRating;
import com.example.mephim.exception.ShowConflictBySameMovieInTimeException;
import com.example.mephim.exception.TokenRefreshException;
import com.example.mephim.exception.UserNotFoundException;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.web.context.request.WebRequest;

import java.util.Date;

@RestControllerAdvice
public class ControllerAdvice {

  @ExceptionHandler(value = TokenRefreshException.class)
  @ResponseStatus(HttpStatus.FORBIDDEN)
  public ErrorMessage handleTokenRefreshException(TokenRefreshException ex, WebRequest request) {
    return new ErrorMessage(
        HttpStatus.FORBIDDEN.value(),
        new Date(),
        ex.getMessage(),
        request.getDescription(false));
  }

  @ExceptionHandler(value = ShowConflictBySameMovieInTimeException.class)
  @ResponseStatus(HttpStatus.BAD_REQUEST)
  public ErrorMessage handleShowConflictBySameMovieInTimeException(ShowConflictBySameMovieInTimeException ex, WebRequest request) {
    return new ErrorMessage(
            HttpStatus.BAD_REQUEST.value(),
            new Date(),
            ex.getMessage(),
            request.getDescription(false));
  }

  @ExceptionHandler(value = UserNotFoundException.class)
  @ResponseStatus(HttpStatus.BAD_REQUEST)
  public ErrorMessage handleUserNotFoundException(UserNotFoundException ex, WebRequest request) {
    return new ErrorMessage(
            HttpStatus.BAD_REQUEST.value(),
            new Date(),
            ex.getMessage(),
            request.getDescription(false));
  }

  @ExceptionHandler(value = NotAllowRating.class)
  @ResponseStatus(HttpStatus.UNAUTHORIZED)
  public ErrorMessage notAllowRating(NotAllowRating ex, WebRequest request) {
    return new ErrorMessage(
            HttpStatus.BAD_REQUEST.value(),
            new Date(),
            ex.getMessage(),
            request.getDescription(false));
  }
}
