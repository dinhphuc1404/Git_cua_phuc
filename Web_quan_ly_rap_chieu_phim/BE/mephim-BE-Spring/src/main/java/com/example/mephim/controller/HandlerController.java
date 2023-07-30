//package com.example.mephim.controller;
//
//import com.example.mephim.constants.Constants;
//import com.example.mephim.response.CustomResponse;
//import org.springframework.http.HttpStatus;
//import org.springframework.http.ResponseEntity;
//import org.springframework.web.bind.annotation.ControllerAdvice;
//import org.springframework.web.bind.annotation.ExceptionHandler;
//
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//@ControllerAdvice
//public class HandlerController {
//    @ExceptionHandler(Exception.class)
//    public ResponseEntity<Object> handle(Exception ex,
//                                         HttpServletRequest request, HttpServletResponse response) {
//        if (ex instanceof NullPointerException) {
//            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
//        }
//        return new ResponseEntity<>(new CustomResponse<>(-100, Constants.RESPONSE_STATUS_ERROR,-100), HttpStatus.BAD_REQUEST);
//    }
//}
