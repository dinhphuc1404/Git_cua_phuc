package com.example.mephim.service;

import com.example.mephim.response.ICategoryStatisResponse;
import com.example.mephim.response.IMovieStatisResponse;
import com.example.mephim.response.ITransStatisResponse;
import com.example.mephim.response.TransactionStatisResponse;

import java.util.List;

public interface StatisService {
    List<ITransStatisResponse> getStatisTransactionByMonthAgo(Integer numMonth);
    List<ITransStatisResponse> getStatisTransactionByDayAgo(Integer numDay);
    List<TransactionStatisResponse> getTransactionChangeOnYear();
    List<TransactionStatisResponse> getTransactionChaneOnWeek();
    List<ITransStatisResponse> getTransactionChangeOnWeek();
    List<IMovieStatisResponse> getMovieStatics(Integer daysAgo);
    List<ICategoryStatisResponse> getCategoryStatics(Integer daysAgo);
}
