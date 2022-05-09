package com.laptrinhjavaweb.repository;

import com.laptrinhjavaweb.entity.AssignmentCustomerEntity;
import com.laptrinhjavaweb.entity.CustomerEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AssignmentCustomerRepository extends JpaRepository<AssignmentCustomerEntity, Long> {
    List<AssignmentCustomerEntity> findByCustomerEntity(CustomerEntity customerEntity);
}
