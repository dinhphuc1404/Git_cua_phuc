package com.example.mephim.security.services;

import com.example.mephim.exception.EmailDuplicateException;
import com.example.mephim.exception.UserNotFoundException;
import com.example.mephim.exception.UsernameDuplicateException;
import com.example.mephim.payload.request.SignupRequest;

public interface AuthService {
    void signUp(SignupRequest signupRequest) throws UsernameDuplicateException, EmailDuplicateException;
    void requestVerifyCode(String email) throws UserNotFoundException;
    void verify(String verifyCode) throws UserNotFoundException;
    void updatePassword(String newPassword, String verifyCode);
}
