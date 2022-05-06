package com.laptrinhjavaweb.service.impl;

import com.laptrinhjavaweb.constant.SystemConstant;
import com.laptrinhjavaweb.converter.CustomerConverter;
import com.laptrinhjavaweb.dto.CustomerDTO;
import com.laptrinhjavaweb.entity.CustomerEntity;
import com.laptrinhjavaweb.repository.CustomerRepository;
import com.laptrinhjavaweb.service.ICustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class CustomerServiceImpl implements ICustomerService {

    @Autowired
    private CustomerRepository customerRepository;

    @Autowired
    private CustomerConverter customerConverter;

    @Override
    public List<CustomerDTO> findAll() {
        List<CustomerEntity> customerEntities = customerRepository.findAll();
        return customerEntities.stream().map(item -> customerConverter.convertToDTO(item)).collect(Collectors.toList());
    }

    @Override
    public CustomerDTO saveCustomer(CustomerDTO customerDTO) {
        CustomerEntity customerEntity = customerConverter.convertToEntity(customerDTO);
        customerEntity.setStatus(SystemConstant.STATUS_DANG_THUC_HIEN);
        return customerConverter.convertToDTO(customerRepository.save(customerEntity));
    }

    @Override
    public void deleteCustomers(Long[] ids) {

    }
}
