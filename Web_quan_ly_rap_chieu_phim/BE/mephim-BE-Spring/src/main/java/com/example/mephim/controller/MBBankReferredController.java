package com.example.mephim.controller;

import com.example.mephim.request.RegisterRequest;
import com.example.mephim.template.mail.MBBank;
import com.example.mephim.ultils.MailSender;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.mail.MessagingException;

@RestController
public class MBBankReferredController {

    @Autowired
    private MailSender mailSender;

    @PostMapping("/ref")
    public ResponseEntity<?> ref(@RequestParam String mail) {
        String message = MBBank.build();
        try {
            mailSender.send(mail, "Chương trình ưu đãi MBBank", message);
        } catch (MessagingException e) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<>(HttpStatus.OK);
    }
}
