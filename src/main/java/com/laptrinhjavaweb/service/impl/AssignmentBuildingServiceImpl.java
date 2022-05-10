package com.laptrinhjavaweb.service.impl;

import com.laptrinhjavaweb.converter.AssignmentBuildingConverter;
import com.laptrinhjavaweb.dto.AssignmentBuildingDTO;
import com.laptrinhjavaweb.entity.AssignmentBuildingEntity;
import com.laptrinhjavaweb.entity.BuildingEntity;
import com.laptrinhjavaweb.entity.UserEntity;
import com.laptrinhjavaweb.repository.AssignmentBuildingRepository;
import com.laptrinhjavaweb.repository.BuildingRepository;
import com.laptrinhjavaweb.repository.UserRepository;
import com.laptrinhjavaweb.service.IAssignmentBuildingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Service
public class AssignmentBuildingServiceImpl implements IAssignmentBuildingService {

    @Autowired
    private AssignmentBuildingRepository assignmentBuildingRepository;

    @Autowired
    private BuildingRepository buildingRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private AssignmentBuildingConverter assignmentBuildingConverter;

    @Transactional
    @Override
    public List<AssignmentBuildingDTO> save(AssignmentBuildingDTO assignmentBuildingDTO) {
        List<Long> listStaffsId = new ArrayList<>(Arrays.asList(assignmentBuildingDTO.getStaffs()));
        List<AssignmentBuildingEntity> assignmentBuildingEntities = assignmentBuildingRepository.findByBuildingEntity(buildingRepository.findOne(assignmentBuildingDTO.getBuildingId()));
        BuildingEntity buildingEntity = buildingRepository.findOne(assignmentBuildingDTO.getBuildingId());
        List<AssignmentBuildingDTO> list = new ArrayList<>();
        for (Long item: listStaffsId) {
                UserEntity userEntity = userRepository.findOne(item);
                AssignmentBuildingEntity assignmentBuildingEntity = new AssignmentBuildingEntity();
                assignmentBuildingEntity.setBuildingEntity(buildingEntity);
                assignmentBuildingEntity.setUserEntity(userEntity);
                //save
                assignmentBuildingEntity = assignmentBuildingRepository.save(assignmentBuildingEntity);
                if (assignmentBuildingEntity != null) {
                    list.add(assignmentBuildingConverter.convertToDTO(assignmentBuildingEntity));
                }
        }
        for (AssignmentBuildingEntity assignmentBuildingEntity: assignmentBuildingEntities) {
                assignmentBuildingRepository.delete(assignmentBuildingEntity.getId());
        }
        return list;
    }

}
