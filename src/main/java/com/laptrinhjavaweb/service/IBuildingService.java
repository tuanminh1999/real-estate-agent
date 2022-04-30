package com.laptrinhjavaweb.service;

import com.laptrinhjavaweb.dto.BuildingDTO;
import com.laptrinhjavaweb.dto.responseDTO.BuildingResponseDTO;

import java.util.List;
import java.util.Map;

public interface IBuildingService {
    public Map<String,String> getDistricts();
    public Map<String,String> getRentTypes();
    public List<BuildingResponseDTO> findAll();
    public BuildingDTO findById(Long id);

    BuildingDTO saveBuilding(BuildingDTO buildingDTO);
}
