package com.example.mephim.request;

import lombok.Data;

import javax.validation.constraints.Null;
import java.util.List;

@Data
public class SaveRoomDto {
    @Null
    private Integer id;
    private String name;
    private Integer width;
    private Integer height;
    private List<Integer> rowVIP;
}
