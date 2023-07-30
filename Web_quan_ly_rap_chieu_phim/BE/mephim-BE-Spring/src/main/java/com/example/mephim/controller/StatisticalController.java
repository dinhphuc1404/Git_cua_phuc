package com.example.mephim.controller;

import com.example.mephim.response.*;
import com.example.mephim.service.StatisService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/statis")
@CrossOrigin("*")
public class StatisticalController {
    @Autowired
    StatisService statisService;

    @GetMapping("/get-transaction-by-month")
    public ResponseEntity<?> getStatisTransactionByMonthAgo(@RequestParam(defaultValue = "1") Integer numMonth) {
        List<ITransStatisResponse> transactionList = statisService.getStatisTransactionByMonthAgo(numMonth);
        return new ResponseEntity<>(new CustomResponse<>(1,transactionList), HttpStatus.OK);
    }
    @GetMapping("/get-transaction-by-day")
    public ResponseEntity<?> getStatisTransactionByDayAgo(@RequestParam(defaultValue = "1") Integer numDay) {
        List<ITransStatisResponse> transactionList = statisService.getStatisTransactionByDayAgo(numDay);
        return new ResponseEntity<>(new CustomResponse<>(1,transactionList), HttpStatus.OK);
    }
    @GetMapping("/get-movie-statics")
    public ResponseEntity<?> getStatisTransactionBy1WeeksAgo(@RequestParam(defaultValue = "1") Integer numDays) {
        List<IMovieStatisResponse> transactionList = statisService.getMovieStatics(numDays);
        return new ResponseEntity<>(new CustomResponse<>(1,transactionList), HttpStatus.OK);
    }
    @GetMapping("/get-change-transaction-one-year")
    public ResponseEntity<?> getTransactionChangeOnYear() {
        List<TransactionStatisResponse> transactionList = statisService.getTransactionChangeOnYear();
        return new ResponseEntity<>(new CustomResponse<>(1,transactionList), HttpStatus.OK);
    }
    @GetMapping("/get-change-transaction-one-week")
    public ResponseEntity<?> getTransactionChangeOnWeek() {
        List<TransactionStatisResponse> transactionList = statisService.getTransactionChaneOnWeek();
        return new ResponseEntity<>(new CustomResponse<>(1,transactionList), HttpStatus.OK);
    }
    @GetMapping("/get-change-category")
    public ResponseEntity<?> getChangeCategory(@RequestParam(defaultValue = "1") Integer numDays) {
        List<ICategoryStatisResponse> statisList = statisService.getCategoryStatics(numDays);
        return new ResponseEntity<>(new CustomResponse<>(1,statisList), HttpStatus.OK);
    }
}
