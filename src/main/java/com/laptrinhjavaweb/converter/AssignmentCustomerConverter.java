package com.laptrinhjavaweb.converter;

import com.laptrinhjavaweb.dto.AssignmentCustomerDTO;
import com.laptrinhjavaweb.entity.AssignmentCustomerEntity;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class AssignmentCustomerConverter {

    @Autowired
    private ModelMapper modelMapper;

    public AssignmentCustomerDTO convertToDTO(AssignmentCustomerEntity entity) {
        AssignmentCustomerDTO result = modelMapper.map(entity, AssignmentCustomerDTO.class);
        return result;
    }

    public AssignmentCustomerEntity convertToEntity(AssignmentCustomerDTO dto) {
        AssignmentCustomerEntity result = modelMapper.map(dto, AssignmentCustomerEntity.class);
        return result;
    }

}
