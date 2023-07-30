package com.example.mephim.repos;

import com.example.mephim.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
  Optional<User> findByUsername(String username);
  Boolean existsByUsername(String username);
  Boolean existsByEmail(String email);
  @Query(value = "select * from users where email = ? and is_enable;", nativeQuery = true)
  Optional<User> findByEmail(String email);
  @Query(value = "select * from users where verification_code = ? and not is_enable", nativeQuery = true)
  Optional<User> findByVerifyCode(String verifyCode);
  @Modifying
  @Query(value = "update users set is_enable = true where verification_code = ? and not is_enable", nativeQuery = true)
  void enableUser(String verifyCode);
  @Modifying
  @Query(value = "update users set available_point = available_point + ? where username=?;", nativeQuery = true)
  void increasePoint(Integer point, String username);
  @Modifying
  @Query(value = "update users set verification_code = ? where username = ? and is_enable", nativeQuery = true)
  void setVerifyCode(String verifyCode, String username);
  @Modifying
  @Query(value = "update users set password = ? where verification_code = ? and not is_enable", nativeQuery = true)
  void updatePassword(String newPassword, String verifyCode);
  @Modifying
  @Query(value = "update users set verification_code = null where verification_code = ? and is_enable", nativeQuery = true)
  void deleteVerifyCode(String verifyCode);
}
