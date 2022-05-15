package com.laptrinhjavaweb.repository.custom;

import com.laptrinhjavaweb.dto.requestDTO.BuildingRequestDTO;
import com.laptrinhjavaweb.entity.BuildingEntity;

import java.util.List;

public interface IBuildingRepositoryCustom {
    List<BuildingEntity> findBuildingsWithJPA(BuildingRequestDTO model);
}
