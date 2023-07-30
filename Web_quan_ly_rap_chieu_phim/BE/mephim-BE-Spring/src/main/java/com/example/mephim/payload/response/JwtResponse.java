package com.example.mephim.payload.response;

import lombok.Data;

import java.util.List;

@Data
public class JwtResponse {
	private String token;
	private String type = "Bearer";
	private String refreshToken;
	private Long id;
	private String username;
	private String email;
	private Integer availablePoint;
	private List<String> roles;

	public JwtResponse(String accessToken, String refreshToken, Long id, String username, String email, Integer availablePoint, List<String> roles) {
		this.token = accessToken;
		this.refreshToken = refreshToken;
		this.id = id;
		this.username = username;
		this.email = email;
		this.roles = roles;
		this.availablePoint = availablePoint;
	}

  public void setRefreshToken(String refreshToken) {
    this.refreshToken = refreshToken;
  }
}
