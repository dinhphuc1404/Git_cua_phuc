package com.example.mephim.response;

import com.example.mephim.entity.User;
import lombok.Data;
import org.springframework.security.core.GrantedAuthority;

import java.util.Collection;

@Data
public class JwtResponse {
    private String jwtToken;
    private User user;

    public JwtResponse(String jwtToken, User user) {
        this.jwtToken = jwtToken;
        this.user = user;
    }
}
