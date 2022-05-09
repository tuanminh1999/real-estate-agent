package com.laptrinhjavaweb.service.impl;

import com.laptrinhjavaweb.constant.SystemConstant;
import com.laptrinhjavaweb.converter.CustomerConverter;
import com.laptrinhjavaweb.dto.CustomerDTO;
import com.laptrinhjavaweb.entity.CustomerEntity;
import com.laptrinhjavaweb.enums.StatusCustomerEnums;
import com.laptrinhjavaweb.exception.MyNullPointerException;
import com.laptrinhjavaweb.repository.CustomerRepository;
import com.laptrinhjavaweb.service.ICustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service
public class CustomerServiceImpl implements ICustomerService {

    @Autowired
    private CustomerRepository customerRepository;

    @Autowired
    private CustomerConverter customerConverter;

    @Transactional(readOnly = true)
    @Override
    public List<CustomerDTO> findAll() {
        List<CustomerEntity> customerEntities = customerRepository.findAll();
        return customerEntities.stream().map(item -> customerConverter.convertToDTO(item)).collect(Collectors.toList());
    }

    @Transactional
    @Override
    public CustomerDTO saveCustomer(CustomerDTO customerDTO) {
        CustomerEntity customerEntity = customerConverter.convertToEntity(customerDTO);
        customerEntity.setStatus(SystemConstant.STATUS_DANG_THUC_HIEN);
        return customerConverter.convertToDTO(customerRepository.save(customerEntity));
    }

    @Transactional
    @Override
    public void deleteCustomers(Long[] idList) {
        for (Long id : idList) {
            if (id == null) {
                throw new MyNullPointerException("Id is null:" + id);
            }
            customerRepository.delete(id);
        }
    }

    @Override
    public Map<String, String> getStatusCustomer() {
        Map<String, String> status = new HashMap<>();
        for (StatusCustomerEnums item : StatusCustomerEnums.values()) {
            status.put(item.toString(), item.getStatusValue());
        }
        return status;
    }

    @Override
    public List<CustomerDTO> getAndCheckStatusByList(Long Id) {
        CustomerEntity customerEntity = customerRepository.findOne(Id);
        List<CustomerDTO> list = new ArrayList<>();
        for (StatusCustomerEnums item : StatusCustomerEnums.values()) {
            CustomerDTO customerDTO  = new CustomerDTO();
            customerDTO.setStatus(item.getStatusValue());
            if (customerEntity.getStatus().equals(item.getStatusValue())){
                customerDTO.setSelected("selected");
            }
            list.add(customerDTO);
        }
        return list;
    }

    @Transactional
    @Override
    public CustomerDTO updateStatus(CustomerDTO customerDTO) {
        CustomerEntity customerEntity = customerRepository.findOne(customerDTO.getId());
        customerEntity.setStatus(customerDTO.getStatus());
        return customerConverter.convertToDTO(customerRepository.save(customerEntity));
    }

    @Override
    public CustomerDTO findById(Long id) {
        if (id == null) {
            throw new MyNullPointerException("Customer id can not be null");
        }
        return customerConverter.convertToDTO(customerRepository.findOne(id));
    }
}
