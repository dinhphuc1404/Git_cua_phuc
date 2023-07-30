package com.example.mephim.controller;

import com.example.mephim.config.Config;
import com.example.mephim.constants.Constants;
import com.example.mephim.request.PaymentDto;
import com.example.mephim.response.CustomResponse;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.*;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.*;

@RestController
@RequestMapping("/api")
@CrossOrigin("*")
public class PaymentController {
    @PostMapping("/create-payment")
    public ResponseEntity<?> createPayment(@RequestBody PaymentDto req) throws UnsupportedEncodingException {
        int amount = req.getAmount() * 100;
        Map<String, String> vnp_Params = new HashMap<>();
        vnp_Params.put("vnp_Version", Config.vnp_Version);
        vnp_Params.put("vnp_Command", Config.vnp_Command);
        vnp_Params.put("vnp_TmnCode", Config.vnp_TmnCode);
        vnp_Params.put("vnp_Amount", String.valueOf(amount));
        vnp_Params.put("vnp_CurrCode", Config.vnp_CurrCode);
        vnp_Params.put("vnp_OrderInfo", req.getVnp_OrderInfo());
        vnp_Params.put("vnp_OrderType", Config.vnp_OrderType);
        vnp_Params.put("vnp_BankCode", Config.vnp_BankCode);
        vnp_Params.put("vnp_TxnRef", Config.getRandomNumber(8));
        vnp_Params.put("vnp_Locale", "vn");
        vnp_Params.put("vnp_IpAddr", Config.DEFAULT_IP);
        vnp_Params.put("vnp_ReturnUrl", Config.vnp_ReturnUrl);
        Calendar cld = Calendar.getInstance(TimeZone.getTimeZone("Etc/GMT+7"));
        SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
        String vnp_CreateDate = formatter.format(cld.getTime());
        vnp_Params.put("vnp_CreateDate", vnp_CreateDate);
        cld.add(Calendar.MINUTE, 15);
        vnp_Params.put("vnp_ExpireDate", formatter.format(cld.getTime()));

        //Build data to hash and querystring
        List fieldNames = new ArrayList(vnp_Params.keySet());
        Collections.sort(fieldNames);
        StringBuilder hashData = new StringBuilder();
        StringBuilder query = new StringBuilder();
        Iterator itr = fieldNames.iterator();
        while (itr.hasNext()) {
            String fieldName = (String) itr.next();
            String fieldValue = (String) vnp_Params.get(fieldName);
            if ((fieldValue != null) && (fieldValue.length() > 0)) {
                //Build hash data
                hashData.append(fieldName);
                hashData.append('=');
                hashData.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
                //Build query
                query.append(URLEncoder.encode(fieldName, StandardCharsets.US_ASCII.toString()));
                query.append('=');
                query.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
                if (itr.hasNext()) {
                    query.append('&');
                    hashData.append('&');
                }
            }
        }
        String queryUrl = query.toString();
        String vnp_SecureHash = Config.hmacSHA512(Config.vnp_HashSecret, hashData.toString());
        queryUrl += "&vnp_SecureHash=" + vnp_SecureHash;
        String paymentUrl = Config.vnp_PayUrl + "?" + queryUrl;

        return new ResponseEntity<>(paymentUrl, HttpStatus.OK);
    }


    @PostMapping("/check-payment")
    public ResponseEntity<?> checkPayment(@RequestBody PaymentDto req) {
        if (req == null) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
        if (req.getVnp_ResponseCode().equals("00")) {
            return new ResponseEntity<>(new CustomResponse<>(23,"OK"), HttpStatus.OK);
        }

        return new ResponseEntity<>(HttpStatus.NOT_FOUND);
    }
}
