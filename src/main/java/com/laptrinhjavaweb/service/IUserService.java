package com.laptrinhjavaweb.service;

import com.laptrinhjavaweb.dto.BuildingDTO;
import com.laptrinhjavaweb.dto.UserDTO;

import java.util.List;

public interface IUserService {
    List<UserDTO> findAll();

    UserDTO saveUser(UserDTO userDTO);

    UserDTO updateUser(UserDTO userDTO);

    void deleteUsers(Long[] idList);

    UserDTO findById(Long id);

    List<UserDTO> findByRoleCustomers(Long roleId, Long customerId);

    List<UserDTO> findByRoleBuidlings(Long roleId,Long buildingId);

    List<UserDTO> findByUsers(String userInfo);
}
