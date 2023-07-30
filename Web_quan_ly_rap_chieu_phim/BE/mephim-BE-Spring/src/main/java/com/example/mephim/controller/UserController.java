package com.example.mephim.controller;


import com.example.mephim.entity.Ticket;
import com.example.mephim.entity.User;
import com.example.mephim.request.UserAddPointDto;
import com.example.mephim.request.UserUpdateDto;
import com.example.mephim.request.UserUpdatePasswordDto;
import com.example.mephim.request.UserVisibleDto;
import com.example.mephim.response.CustomResponse;
import com.example.mephim.response.UserResponse;
import com.example.mephim.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/users")
@CrossOrigin("*")
public class UserController {
    @Autowired
    UserService userService;
    @GetMapping("/find-all")
    public ResponseEntity<?> findAllTicket() {
        List<UserResponse> userResponseList = userService.findAllUser();
        return new ResponseEntity<>(new CustomResponse<>(1,userResponseList), HttpStatus.OK);
    }

    @GetMapping("/detail")
    public ResponseEntity<?> detail(@RequestParam String username) {
        User user = userService.findByUsername(username);
        return new ResponseEntity<>(new CustomResponse<>(1,user), HttpStatus.OK);
    }
    @PostMapping("/add-point")
    public ResponseEntity<?> addPoint(@RequestBody UserAddPointDto userAddPointDto) {
        Boolean isError = userService.addPoint(userAddPointDto.getPoint(), userAddPointDto.getEmail());
        return new ResponseEntity<>(new CustomResponse<>(1,isError), HttpStatus.OK);
    }
    @PostMapping("/update-info")
    public ResponseEntity<?> updateInfo(@RequestBody UserUpdateDto userUpdateDto) {
        Boolean isError = userService.updateInfo(userUpdateDto.getName(), userUpdateDto.getPhone(), userUpdateDto.getEmail());
        return new ResponseEntity<>(new CustomResponse<>(1,isError), HttpStatus.OK);
    }
    @PostMapping("/update-password")
    public ResponseEntity<?> updatePassword(@RequestBody UserUpdatePasswordDto userUpdatePasswordDto) {
        Boolean isError = userService.updatePassword(userUpdatePasswordDto.getNewPassword(), userUpdatePasswordDto.getEmail());
        return new ResponseEntity<>(new CustomResponse<>(1,isError), HttpStatus.OK);
    }
    @PostMapping("/set-visible")
    public ResponseEntity<?> setVisible(@RequestBody UserVisibleDto userVisibleDto) {
        Boolean isError = userService.setVisible(userVisibleDto.getIsEnable(), userVisibleDto.getEmail(),  userVisibleDto.getReason());
        return new ResponseEntity<>(new CustomResponse<>(1,isError), HttpStatus.OK);
    }
}
