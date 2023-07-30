package com.example.mephim.service.impl;

import com.example.mephim.entity.User;
import com.example.mephim.repos.UserRepo;
import com.example.mephim.response.UserResponse;
import com.example.mephim.service.UserService;
import com.example.mephim.template.mail.ConfirmMailTemplate;
import com.example.mephim.ultils.MailSender;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import javax.mail.MessagingException;
import java.util.List;

import static com.example.mephim.constants.Constants.RESET_PASSWORD;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    UserRepo userRepo;
    @Autowired
    MailSender mailSender;
    @Autowired
    PasswordEncoder encoder;

    @Override
    public User findByUsername(String username) {
        return userRepo.findByUsername(username);
    }

    @Override
    public User createNewUser(User user) {
        return null;
    }

    @Override
    public List<UserResponse> findAllUser() {
        return userRepo.findAllUser();
    }

    @Override
    public Boolean addPoint(Integer point, String email) {
        int rowUpdated = userRepo.addPoint(point, email);
        if (rowUpdated == 0) return false;

        Thread thread = new Thread(() -> {
            try {
                mailSender.send(email, "BẠN ĐƯỢC CỘNG ĐIỂM","Xin chào " + email + "\nBạn vừa được cộng "+ point + "\nHãy đăng nhập và sử dụng điểm ngay");
            } catch (MessagingException e) {
                throw new RuntimeException(e);
            }
        });
        thread.start();

        return true;
    }

    @Override
    public Boolean setVisible(Boolean isEnable, String email, String reason) {
        int rowUpdated = userRepo.updateIsEnableUser(isEnable, email);
        if(rowUpdated == 0 || reason.equals("")) return false;

        Thread thread = new Thread(() -> {
            try {
                mailSender.send(email, "TÀI KHOẢN BỊ KHOÁ","Xin chào " + email + "\nTài khoản bạn bị khoá vì lí do "+ reason + "\nHãy liên hệ Admin để mở khoá");
            } catch (MessagingException e) {
                throw new RuntimeException(e);
            }
        });
        thread.start();
        return true;
    }

    @Override
    public Boolean updateInfo(String name, String phone, String email) {
        return userRepo.updateInfo(name, phone, email) > 0;
    }

    @Override
    public Boolean updatePassword(String newPassword, String email) {
        return userRepo.updatePassword(encoder.encode(newPassword), email) > 0;
    }
}
