package com.laptrinhjavaweb.service;

import com.laptrinhjavaweb.dto.AssignmentBuildingDTO;

import java.util.List;

public interface IAssignmentBuildingService {
    public List<AssignmentBuildingDTO> save(AssignmentBuildingDTO assignmentBuildingDTO);
}
