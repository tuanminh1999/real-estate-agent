package com.laptrinhjavaweb.service;

import com.laptrinhjavaweb.dto.RentAreaDTO;

import java.util.List;

public interface IRentAreaService {
    public List<RentAreaDTO> findByBuildingId(Long buildingId);
}
