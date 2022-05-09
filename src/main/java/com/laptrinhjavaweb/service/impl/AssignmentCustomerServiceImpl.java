package com.laptrinhjavaweb.service.impl;

import com.laptrinhjavaweb.converter.AssignmentCustomerConverter;
import com.laptrinhjavaweb.dto.AssignmentCustomerDTO;
import com.laptrinhjavaweb.entity.AssignmentCustomerEntity;
import com.laptrinhjavaweb.entity.CustomerEntity;
import com.laptrinhjavaweb.entity.UserEntity;
import com.laptrinhjavaweb.repository.AssignmentCustomerRepository;
import com.laptrinhjavaweb.repository.CustomerRepository;
import com.laptrinhjavaweb.repository.UserRepository;
import com.laptrinhjavaweb.service.IAssignmentCustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Service
public class AssignmentCustomerServiceImpl implements IAssignmentCustomerService {

    @Autowired
    private AssignmentCustomerRepository assignmentCustomerRepository;

    @Autowired
    private CustomerRepository customerRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private AssignmentCustomerConverter assignmentCustomerConverter;

    @Transactional
    @Override
    public List<AssignmentCustomerDTO> save(AssignmentCustomerDTO assignmentCustomer) {
        List<Long> listStaffsId = new ArrayList<>(Arrays.asList(assignmentCustomer.getStaffs()));
        List<AssignmentCustomerEntity> assignmentCustomerEntities = assignmentCustomerRepository
                .findByCustomerEntity(customerRepository.findOne(assignmentCustomer.getCustomerId()));
        CustomerEntity customerEntity = customerRepository.findOne(assignmentCustomer.getCustomerId());
        List<AssignmentCustomerDTO> list = new ArrayList<>();
        for (Long item: listStaffsId) {
            if (!assignmentCustomerEntities.contains(item)){
                UserEntity userEntity = userRepository.findOne(item); //1 -> User_1
                AssignmentCustomerEntity assignmentCustomerEntity = new AssignmentCustomerEntity();
                assignmentCustomerEntity.setCustomerEntity(customerEntity);
                assignmentCustomerEntity.setUserEntity(userEntity);
                //save
                assignmentCustomerEntity = assignmentCustomerRepository.save(assignmentCustomerEntity);
                if (assignmentCustomerEntity != null) {
                    list.add(assignmentCustomerConverter.convertToDTO(assignmentCustomerEntity));
                }
            }else{
                list.add(assignmentCustomerConverter.convertToDTO(assignmentCustomerRepository.findOne(item)));
            }
        }
        for (AssignmentCustomerEntity assignmentCustomerEntity: assignmentCustomerEntities) {
            if (!listStaffsId.contains(assignmentCustomerEntity.getId())){
                assignmentCustomerRepository.delete(assignmentCustomerEntity.getId());
            }
        }
        return list;
    }
}
