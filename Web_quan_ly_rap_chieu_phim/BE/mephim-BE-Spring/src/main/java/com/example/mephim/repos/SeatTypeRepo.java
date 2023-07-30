package com.example.mephim.repos;

import com.example.mephim.entity.SeatType;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface SeatTypeRepo extends JpaRepository<SeatType, Integer> {
}
