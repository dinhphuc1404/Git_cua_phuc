package com.example.mephim.security.services;

import com.example.mephim.entity.EProvider;
import com.example.mephim.entity.ERole;
import com.example.mephim.entity.Role;
import com.example.mephim.entity.User;
import com.example.mephim.exception.EmailDuplicateException;
import com.example.mephim.exception.UserNotFoundException;
import com.example.mephim.exception.UsernameDuplicateException;
import com.example.mephim.payload.request.SignupRequest;
import com.example.mephim.repos.RoleRepository;
import com.example.mephim.repos.UserRepository;
import com.example.mephim.template.mail.ConfirmMailTemplate;
import com.example.mephim.ultils.MailSender;
import com.example.mephim.ultils.RandomString;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.mail.MessagingException;
import java.time.Instant;
import java.util.HashSet;
import java.util.Set;

import static com.example.mephim.constants.Constants.RESET_PASSWORD;
import static com.example.mephim.constants.Constants.VERIFY_MAIL;

@Service
public class AuthServiceImpl implements AuthService {
    @Autowired
    UserRepository userRepository;

    @Autowired
    RoleRepository roleRepository;

    @Autowired
    PasswordEncoder encoder;

    @Autowired
    MailSender mailSender;

    @Override
    public void signUp(SignupRequest signUpRequest) throws UsernameDuplicateException, EmailDuplicateException {
        if (userRepository.existsByUsername(signUpRequest.getEmail())) {
            throw new UsernameDuplicateException();
        }

        if (userRepository.existsByEmail(signUpRequest.getEmail())) {
            throw new EmailDuplicateException();
        }

        // Create new user's account
        User user = new User(signUpRequest.getEmail(), signUpRequest.getEmail(),
                encoder.encode(signUpRequest.getPassword()), Instant.now(), EProvider.REGISTER.toString(), false);

        Set<String> strRoles = signUpRequest.getRole();
        Set<Role> roles = new HashSet<>();

        if (strRoles == null) {
            Role userRole = roleRepository.findByName(ERole.ROLE_USER)
                    .orElseThrow(() -> new RuntimeException("Error: Role is not found."));
            roles.add(userRole);
        } else {
            strRoles.forEach(role -> {
                switch (role) {
                    case "admin":
                        Role adminRole = roleRepository.findByName(ERole.ROLE_ADMIN)
                                .orElseThrow(() -> new RuntimeException("Error: Role is not found."));
                        roles.add(adminRole);

                        break;
                    case "mod":
                        Role modRole = roleRepository.findByName(ERole.ROLE_MODERATOR)
                                .orElseThrow(() -> new RuntimeException("Error: Role is not found."));
                        roles.add(modRole);

                        break;
                    default:
                        Role userRole = roleRepository.findByName(ERole.ROLE_USER)
                                .orElseThrow(() -> new RuntimeException("Error: Role is not found."));
                        roles.add(userRole);
                }
            });
        }

        // create verify code by random string
        String verifyCode = generateCode();

        user.setRoles(roles);
        user.setVerificationCode(verifyCode);
        userRepository.save(user);

        // send verify code to the mail user to verify account
        sendCodeVerifyAccount(user.getEmail(), user.getUsername(), verifyCode);
    }

    public void sendCodeVerifyAccount(String email, String username, String code) {
        try {
            mailSender.send(email, VERIFY_MAIL, ConfirmMailTemplate.build(username, "localhost:3000/verify?code=" + code));
        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }

    String generateCode() {
        return RandomString.generateString(50);
    }

    @Override @Transactional
    public void requestVerifyCode(String email) throws UserNotFoundException {
        // before send mail reset password must check user is not disable
        User user = userRepository.findByEmail(email).orElseThrow(UserNotFoundException::new);
        String verifyCode = generateCode();
        userRepository.setVerifyCode(verifyCode, user.getUsername());
        try {
            mailSender.send(email, RESET_PASSWORD, ConfirmMailTemplate.build(user.getUsername(), "localhost:3000/reset?" + verifyCode));
        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }

    @Override @Transactional
    public void updatePassword(String newPassword, String verifyCode) {
        userRepository.updatePassword(newPassword, verifyCode);
    }

    @Override @Transactional
    public void verify(String verifyCode) throws UserNotFoundException {
        userRepository.findByVerifyCode(verifyCode).orElseThrow(UserNotFoundException::new);
        userRepository.enableUser(verifyCode);
        userRepository.deleteVerifyCode(verifyCode);
    }
}
