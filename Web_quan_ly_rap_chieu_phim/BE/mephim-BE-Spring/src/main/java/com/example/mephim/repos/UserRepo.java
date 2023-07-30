package com.example.mephim.repos;

import com.example.mephim.entity.User;
import com.example.mephim.response.UserResponse;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public interface UserRepo extends JpaRepository<User, Integer> {
    @Query(value = "SELECT * FROM `users` WHERE username = ?1", nativeQuery = true)
    User findByUsername(String username);

    @Query(value = "select id, email, phone, name, register_date, available_point, is_enable\n" +
            "from users inner join user_roles\n" +
            "where users.id = user_roles.user_id\n" +
            "and user_roles.role_id = 1;\n",nativeQuery = true)
    List<UserResponse> findAllUser();
    @Transactional
    @Modifying
    @Query(value = "update users set available_point = available_point + ? where users.email = ?;", nativeQuery = true)
    int addPoint(Integer point, String email);
    @Transactional
    @Modifying
    @Query(value = "update users set is_enable = ? where users.email = ?;", nativeQuery = true)
    int updateIsEnableUser(Boolean isEnable, String email);

    @Transactional
    @Modifying
    @Query(value = "update users set name=?, phone=? where users.email = ?;", nativeQuery = true)
    int updateInfo(String name, String phone, String email);
    @Transactional
    @Modifying
    @Query(value = "update users set password=? where users.email = ?;", nativeQuery = true)
    int updatePassword(String newPassword, String email);
}
