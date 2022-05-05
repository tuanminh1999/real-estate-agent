package com.laptrinhjavaweb.service.impl;

import com.laptrinhjavaweb.converter.RoleConverter;
import com.laptrinhjavaweb.dto.RoleDTO;
import com.laptrinhjavaweb.entity.RoleEntity;
import com.laptrinhjavaweb.repository.RoleRepository;
import com.laptrinhjavaweb.service.IRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.vote.RoleVoter;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class RoleServiceImpl implements IRoleService {

    @Autowired
    private RoleRepository roleRepository;

    @Autowired
    private RoleConverter roleConverter;

    @Override
    public Map<String, String> getRoles() {
        Map<String,String> roleTerm = new HashMap<>();
        List<RoleEntity> roleEntity = roleRepository.findAll();
        roleEntity.forEach(entity ->{
            RoleDTO roleDTO = roleConverter.convertToDTO(entity);
            roleTerm.put(roleDTO.getCode(), roleDTO.getName());
        });

        return roleTerm;
    }
}
