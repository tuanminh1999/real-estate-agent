package com.laptrinhjavaweb.service.impl;

import com.laptrinhjavaweb.converter.BuildingConverter;
import com.laptrinhjavaweb.dto.BuildingDTO;
import com.laptrinhjavaweb.dto.responseDTO.BuildingResponseDTO;
import com.laptrinhjavaweb.entity.BuildingEntity;
import com.laptrinhjavaweb.enums.DistrictEnums;
import com.laptrinhjavaweb.enums.RentTypesEnums;
import com.laptrinhjavaweb.repository.BuildingRepository;
import com.laptrinhjavaweb.service.IBuildingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service
public class BuildingServiceImpl implements IBuildingService {

    @Autowired
    private BuildingRepository buildingRepository;

    @Autowired
    private BuildingConverter buildingConverter;

    @Override
    public Map<String, String> getDistricts() {
        Map<String, String> districts = new HashMap<>();
        for(DistrictEnums item : DistrictEnums.values()){
            districts.put(item.toString(), item.getDistricValue());
        }
        return districts;
    }

    @Override
    public Map<String, String> getRentTypes() {
        Map<String, String> rentTypes = new HashMap<>();
        for(RentTypesEnums item : RentTypesEnums.values()){
            rentTypes.put(item.toString(), item.getRentTypeValue());
        }
        return rentTypes;
    }

    @Override
    public List<BuildingResponseDTO> findAll() {
        List<BuildingEntity> buildingEntities = buildingRepository.findAll();
        return buildingEntities.stream().map(item -> buildingConverter.convertToDTO(item)).collect(Collectors.toList());
    }
}
