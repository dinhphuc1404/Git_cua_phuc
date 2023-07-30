package com.example.mephim.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;
import java.time.Instant;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Table(	name = "users",
        uniqueConstraints = {
                @UniqueConstraint(columnNames = "username"),
                @UniqueConstraint(columnNames = "email")
        })
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;
    @NotBlank
    private String username;
    @NotBlank
    @Email
    private String email;
    @NotBlank
    private String password;
//    @NotBlank
    private String phone;

    public User(String username, String email, String password, Instant registerDate) {
        this.username = username;
        this.email = email;
        this.password = password;
        this.registerDate = registerDate;
    }

    public User(String username, String email, String password, Instant registerDate, String provider, Boolean isEnable) {
        this.username = username;
        this.email = email;
        this.password = password;
        this.registerDate = registerDate;
        this.provider = provider;
        this.isEnable = isEnable;
    }
    @Column(nullable = false)
    private Instant registerDate;
    @Size(max = 500)
    private String verificationCode;
    @Size(max = 20)
    private String provider;
    private Integer availablePoint;
    @Column(name = "is_enable", columnDefinition = "bit(1)")
    private Boolean isEnable;

    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(	name = "user_roles",
            joinColumns = @JoinColumn(name = "user_id"),
            inverseJoinColumns = @JoinColumn(name = "role_id"))
    private Set<Role> roles = new HashSet<>();

    @OneToMany(mappedBy = "bookingId")
    @JsonIgnore
    private List<Booking> bookings;

    @OneToMany(mappedBy = "rateId")
    @JsonIgnore
    private List<Rate> rates;
}
