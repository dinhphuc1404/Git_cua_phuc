package com.example.mephim.request;

import lombok.Data;

import java.util.List;

@Data
public class RoomEditDto {
    private String name;
    private Integer roomId;
    private Integer width;
    private Integer height;
    private List<Integer> rowVIP;
}
