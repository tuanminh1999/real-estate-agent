package com.laptrinhjavaweb.api.admin;

import com.laptrinhjavaweb.dto.AssignmentBuildingDTO;
import com.laptrinhjavaweb.dto.BuildingDTO;
import com.laptrinhjavaweb.dto.UserDTO;
import com.laptrinhjavaweb.service.IAssignmentBuildingService;
import com.laptrinhjavaweb.service.IBuildingService;
import com.laptrinhjavaweb.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("api/buildings")
public class BuildingAPI {

    @Autowired
    private IBuildingService buildingService;

    @Autowired
    private IUserService userService;

    @Autowired
    private IAssignmentBuildingService assignmentBuilding;

    @PostMapping
    public BuildingDTO saveBuilding(@RequestBody BuildingDTO buildingDTO) {
        return buildingService.saveBuilding(buildingDTO);
    }

    @PutMapping
    public BuildingDTO updateBuilding(@RequestBody BuildingDTO buildingDTO) {
        return buildingService.saveBuilding(buildingDTO);
    }

    @DeleteMapping
    public void deleteBuilding(@RequestBody Long[] idList) {
        if (idList.length > 0) {
            buildingService.deleteBuildings(idList);
        }
    }

    @GetMapping(value = "/{id}/staffs")
    public List<UserDTO> showStaffs(@PathVariable Long id){
        return userService.findByRoleBuidlings((long) 2,id);
    }

    @PostMapping("/assignBuilding")
    public String assignBuilding(@RequestBody AssignmentBuildingDTO responseDTO){
        List<AssignmentBuildingDTO> list= assignmentBuilding.save(responseDTO);
        if (list != null){
            return "success";
        }
        return "fail";
    }

}
