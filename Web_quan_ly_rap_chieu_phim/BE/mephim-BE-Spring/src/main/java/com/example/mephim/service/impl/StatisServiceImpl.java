package com.example.mephim.service.impl;

import com.example.mephim.repos.StatisRepo;
import com.example.mephim.response.ICategoryStatisResponse;
import com.example.mephim.response.IMovieStatisResponse;
import com.example.mephim.response.ITransStatisResponse;
import com.example.mephim.response.TransactionStatisResponse;
import com.example.mephim.service.StatisService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class StatisServiceImpl implements StatisService {
    @Autowired
    StatisRepo statisRepo;

    @Override
    public List<ITransStatisResponse> getStatisTransactionByMonthAgo(Integer numMonth) {
        return statisRepo.getStatisTransactionByMonthAgo(numMonth);
    }

    @Override
    public List<ITransStatisResponse> getStatisTransactionByDayAgo(Integer numDay) {
        return statisRepo.getStatisTransactionByDayAgo(numDay);
    }

    @Override
    public List<TransactionStatisResponse> getTransactionChangeOnYear() {
        List<ITransStatisResponse> transactionList = statisRepo.getTransactionChangeOnYear();

        // if full 12 month return this list
        if (transactionList.size() == 12)
            return statisRepo.getTransactionChangeOnYear().stream().map(i -> new TransactionStatisResponse(i.getTransactionDay(), i.getValue())).collect(Collectors.toList());
        List<ITransStatisResponse> transactionConverter = transactionList.stream().map(i -> {
            // convert 4-2022 -> 04-2022
            if (i.getTransactionDay().split("-")[0].length() == 1) {
                return new ITransStatisResponse() {
                    @Override
                    public String getTransactionDay() {
                        return "0" + i.getTransactionDay();
                    }

                    @Override
                    public Integer getValue() {
                        return i.getValue();
                    }
                };
            }
            return i;
        }).collect(Collectors.toList());

        // get full transaction for 12 month
        List<String> list12MonthsAgo;
        try {
            list12MonthsAgo = getList12MonthsAgo();
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }

        return getFullTransaction(transactionConverter, list12MonthsAgo);
    }

    @Override
    public List<TransactionStatisResponse> getTransactionChaneOnWeek() {
        List<ITransStatisResponse> transactionList = statisRepo.getTransactionChaneOnWeek();

        // if full 12 month return this list
        if (transactionList.size() == 12)
            return statisRepo.getTransactionChaneOnWeek().stream().map(i -> new TransactionStatisResponse(i.getTransactionDay(), i.getValue())).collect(Collectors.toList());

        // get full transaction for 7 days
        List<String> list7days;
        try {
            list7days = getList7DaysAgo();
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }

        return getFullTransaction(transactionList, list7days);
    }

    private List<TransactionStatisResponse> getFullTransaction(List<ITransStatisResponse> transactionList, List<String> times) {
        System.err.println("List to queries: " + times);
        List<TransactionStatisResponse> responseList = new ArrayList<>();
        for (int i = 0; i < times.size(); i++) {
            boolean isAdd = false;
            for (int j = 0; j < transactionList.size(); j++) {
                if (times.get(i).equals(transactionList.get(j).getTransactionDay())) {
                    responseList.add(new TransactionStatisResponse(transactionList.get(j).getTransactionDay(), transactionList.get(j).getValue()));
                    isAdd = true;
                    break;
                }
            }
            if (!isAdd) responseList.add(new TransactionStatisResponse(times.get(i), 0));
        }
        return responseList;
    }

    @Override
    public List<ITransStatisResponse> getTransactionChangeOnWeek() {
        return statisRepo.getStatisTransactionByDayAgo(7);
    }

    @Override
    public List<IMovieStatisResponse> getMovieStatics(Integer daysAgo) {
        return statisRepo.getMovieStatics(daysAgo);
    }

    @Override
    public List<ICategoryStatisResponse> getCategoryStatics(Integer daysAgo) {
        return statisRepo.getCategoryStatisBy1WeeksAgo(daysAgo);
    }

    public List<String> getList12MonthsAgo() throws ParseException {
        List<String> allDates = new ArrayList<>();
//        String maxDate = "Jan-2016";
        SimpleDateFormat monthDate = new SimpleDateFormat("MM-yyyy");
        Calendar cal = Calendar.getInstance();
//        cal.setTime(monthDate.parse(maxDate));
        for (int i = 1; i <= 12; i++) {
            String month_name1 = monthDate.format(cal.getTime());
            allDates.add(month_name1);
            cal.add(Calendar.MONTH, -1);
        }

        // revert list to increase by time
        List<String> shallowCopy = allDates.subList(0, allDates.size());
        Collections.reverse(shallowCopy);

        return shallowCopy;
    }

    public List<String> getList7DaysAgo() throws ParseException {
        List<String> allDates = new ArrayList<>();
//        String maxDate = "Jan-2016";
        SimpleDateFormat monthDate = new SimpleDateFormat("yyyy-MM-dd");
        Calendar cal = Calendar.getInstance();
//        cal.setTime(monthDate.parse(maxDate));
        for (int i = 1; i <= 7; i++) {
            String month_name1 = monthDate.format(cal.getTime());
            allDates.add(month_name1);
            cal.add(Calendar.DATE, -1);
        }

        // revert list to increase by time
        List<String> shallowCopy = allDates.subList(0, allDates.size());
        Collections.reverse(shallowCopy);

        return allDates;
    }
}
