package com.laptrinhjavaweb.service.impl;

import com.laptrinhjavaweb.converter.RentAreaConverter;
import com.laptrinhjavaweb.dto.RentAreaDTO;
import com.laptrinhjavaweb.entity.RentAreaEntity;
import com.laptrinhjavaweb.repository.RentAreaRepository;
import com.laptrinhjavaweb.service.IRentAreaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class RentAreaServiceImpl implements IRentAreaService {

    @Autowired
    private RentAreaRepository rentAreaRepository;

    @Autowired
    private RentAreaConverter rentAreaConverter;

    @Override
    public List<RentAreaDTO> findByBuildingId(Long buildingId) {
        List<RentAreaEntity> rentAreaEntities = rentAreaRepository.findByBuildingId(buildingId);
        return rentAreaEntities.stream().map(item -> rentAreaConverter.convertToDTO(item)).collect(Collectors.toList());
    }
}
