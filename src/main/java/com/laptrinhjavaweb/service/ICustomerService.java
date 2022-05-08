package com.laptrinhjavaweb.service;

import com.laptrinhjavaweb.dto.CustomerDTO;

import java.util.List;
import java.util.Map;

public interface ICustomerService {
    List<CustomerDTO> findAll();

    CustomerDTO saveCustomer(CustomerDTO customerDTO);

    void deleteCustomers(Long[] ids);

    CustomerDTO findById(Long id);

    Map<String, String> getStatusCustomer();

    List<CustomerDTO> getAndCheckStatusByList(Long Id);

    CustomerDTO updateStatus(CustomerDTO customerDTO);
}
