package com.laptrinhjavaweb.service.impl;

import com.laptrinhjavaweb.converter.BuildingConverter;
import com.laptrinhjavaweb.dto.BuildingDTO;
import com.laptrinhjavaweb.dto.responseDTO.BuildingResponseDTO;
import com.laptrinhjavaweb.entity.BuildingEntity;
import com.laptrinhjavaweb.entity.RentAreaEntity;
import com.laptrinhjavaweb.enums.DistrictEnums;
import com.laptrinhjavaweb.enums.RentTypesEnums;
import com.laptrinhjavaweb.exception.MyNullPointerException;
import com.laptrinhjavaweb.repository.BuildingRepository;
import com.laptrinhjavaweb.repository.RentAreaRepository;
import com.laptrinhjavaweb.service.IBuildingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service
public class BuildingServiceImpl implements IBuildingService {

    @Autowired
    private BuildingRepository buildingRepository;

    @Autowired
    private RentAreaRepository rentAreaRepository;

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
        return buildingEntities.stream().map(item -> buildingConverter.convertToResDTO(item)).collect(Collectors.toList());
    }

    @Override
    public BuildingDTO findById(Long id) {
        BuildingDTO buildingDTO = buildingConverter.convertToDTO(buildingRepository.findOne(id));
        if (buildingDTO == null) {
            throw new MyNullPointerException("NullPointerException about BuildingDTO");
        }
        return buildingDTO;
    }

    @Override
    public BuildingDTO saveBuilding(BuildingDTO buildingDTO) {
        //        checkException(buildingDTO);
        BuildingEntity buildingEntity = buildingConverter.convertToEntity(buildingDTO);
        if (buildingDTO != null && buildingDTO.getRentTypes().length > 0) {
            String rentTypes = String.join(",", buildingDTO.getRentTypes());
            buildingEntity.setType(rentTypes);
        }
        if (buildingDTO.getAreaRent() != null) {
            List<RentAreaEntity> rentAreaEntityList = new ArrayList<>();
            String[] arr = buildingDTO.getAreaRent().split(",");
            for (String item : arr) {
                if (item != null && !item.equals("")) {
                    RentAreaEntity rentAreaEntity = new RentAreaEntity();
                    if (buildingDTO.getId() != null) {
                        rentAreaRepository.deleteByBuildingEntity(buildingEntity);
                    }
                    rentAreaEntity.setBuildingEntity(buildingEntity);
                    rentAreaEntity.setValue(Integer.valueOf(item));
                    rentAreaEntityList.add(rentAreaEntity);
                }
            }
            buildingEntity.setAreaEntities(rentAreaEntityList);
        }

        return buildingConverter.convertToDTO(buildingRepository.save(buildingEntity));
    }
}
