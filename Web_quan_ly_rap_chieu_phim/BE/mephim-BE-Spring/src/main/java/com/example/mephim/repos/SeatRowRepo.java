package com.example.mephim.repos;

import com.example.mephim.entity.SeatRow;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface SeatRowRepo extends JpaRepository<SeatRow, Integer> {
}
