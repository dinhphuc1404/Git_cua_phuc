package com.example.mephim.repos;
import com.example.mephim.entity.SeatColumn;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface SeatColumnRepo extends JpaRepository<SeatColumn, Integer> {
}
