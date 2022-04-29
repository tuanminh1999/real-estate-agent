package com.laptrinhjavaweb.converter;

import com.laptrinhjavaweb.dto.BuildingDTO;
import com.laptrinhjavaweb.dto.RentAreaDTO;
import com.laptrinhjavaweb.dto.responseDTO.BuildingResponseDTO;
import com.laptrinhjavaweb.entity.BuildingEntity;
import com.laptrinhjavaweb.service.IBuildingService;
import com.laptrinhjavaweb.service.IRentAreaService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;

@Component
public class BuildingConverter {

    @Autowired
    private ModelMapper modelMapper;

    @Autowired
    private IBuildingService buildingService;

    @Autowired
    private IRentAreaService rentAreaService;

    public BuildingResponseDTO convertToDTO(BuildingEntity entity) {
        BuildingResponseDTO result = modelMapper.map(entity, BuildingResponseDTO.class);
        Map<String, String> districts = buildingService.getDistricts();
        for (Map.Entry<String, String> entry : districts.entrySet()) {
            if (entry.getKey().equals(result.getDistrict())) {
                result.setAddress(entity.getWard() + "," + entity.getStreet() + "," + entry.getValue());
            }
        }
        if (result.getId() != null) {
            String rentArea = "";
            List<RentAreaDTO> rentAreaDTOS = rentAreaService.findByBuildingId(result.getId());
            for (RentAreaDTO item : rentAreaDTOS) {
                if (rentArea.length() > 0){
                    rentArea += ", ";
                }
                if (item.getValue() != null){
                    rentArea += item.getValue();
                }
            }
            result.setRentArea(rentArea);
        }
        return result;
    }

    public BuildingEntity convertToEntity(BuildingDTO dto) {
        BuildingEntity result = modelMapper.map(dto, BuildingEntity.class);
        return result;
    }

}
