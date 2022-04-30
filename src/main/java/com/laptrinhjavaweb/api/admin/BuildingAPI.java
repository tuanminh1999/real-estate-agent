package com.laptrinhjavaweb.api.admin;

import com.laptrinhjavaweb.dto.BuildingDTO;
import com.laptrinhjavaweb.service.IBuildingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("api/buildings")
public class BuildingAPI {

    @Autowired
    private IBuildingService buildingService;

    @PostMapping
    public BuildingDTO saveBuilding(@RequestBody BuildingDTO buildingDTO) {
        return buildingService.saveBuilding(buildingDTO);
    }

}
