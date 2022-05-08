package com.laptrinhjavaweb.service.impl;

import com.laptrinhjavaweb.constant.SystemConstant;
import com.laptrinhjavaweb.converter.UserConverter;
import com.laptrinhjavaweb.dto.UserDTO;
import com.laptrinhjavaweb.entity.RoleEntity;
import com.laptrinhjavaweb.entity.UserEntity;
import com.laptrinhjavaweb.exception.MyNullPointerException;
import com.laptrinhjavaweb.repository.RoleRepository;
import com.laptrinhjavaweb.repository.UserRepository;
import com.laptrinhjavaweb.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

@Service
public class UserServiceImpl implements IUserService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private RoleRepository roleRepository;

    @Autowired
    private UserConverter userConverter;

    @Transactional(readOnly = true)
    @Override
    public List<UserDTO> findAll() {
        List<UserEntity> userEntities = userRepository.findAll();
        return userEntities.stream().map(item -> userConverter.convertToDTO(item)).collect(Collectors.toList());
    }

    @Transactional
    @Override
    public UserDTO saveUser(UserDTO userDTO) {
        RoleEntity role = roleRepository.findOneByCode(userDTO.getRoleCode());
        UserEntity userEntity = userConverter.convertToEntity(userDTO);
        userEntity.setRoleEntities(Stream.of(role).collect(Collectors.toList()));
        userEntity.setStatus(1);
        userEntity.setPassword(SystemConstant.PASSWORD_DEFAULT);
        UserEntity entity = userRepository.save(userEntity);
        return userConverter.convertToDTO(entity);
    }

    @Transactional
    @Override
    public UserDTO updateUser(UserDTO userDTO) {
        RoleEntity role = roleRepository.findOneByCode(userDTO.getRoleCode());
        UserEntity oldUser = userRepository.findOne(userDTO.getId());
        UserEntity userEntity = userConverter.convertToEntity(userDTO);
        userEntity.setUserName(oldUser.getUserName());
        userEntity.setStatus(oldUser.getStatus());
        userEntity.setRoleEntities(Stream.of(role).collect(Collectors.toList()));
        userEntity.setPassword(oldUser.getPassword());
        return userConverter.convertToDTO(userRepository.save(userEntity));
    }

    @Transactional
    @Override
    public void deleteUsers(Long[] idList) {
        for (Long id : idList) {
            if (id == null) {
                throw new MyNullPointerException("Id is null:" + id);
            }
            userRepository.delete(id);
        }
    }

    @Override
    public UserDTO findById(Long id) {
        if (id == null) {
            throw new MyNullPointerException("User id can not be null");
        }

        UserEntity entity = userRepository.findOne(id);

        List<RoleEntity> roles = entity.getRoleEntities();
        UserDTO userDTO = userConverter.convertToDTO(entity);
        roles.forEach(item -> {
            userDTO.setRoleCode(item.getCode());
        });

        return userDTO;
    }

}
