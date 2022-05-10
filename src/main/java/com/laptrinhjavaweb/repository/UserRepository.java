package com.laptrinhjavaweb.repository;

import com.laptrinhjavaweb.entity.UserEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserRepository extends JpaRepository<UserEntity, Long> {

    @Query(value = "select * from users u inner join user_role ur on u.id = ur.user_id where ur.role_id = ?1", nativeQuery = true)
    List<UserEntity> findByRoles(Long roleId);

    @Query(value = "select * from users u join assignment_customer a on u.id = a.staff_id where a.customer_id = ?1",nativeQuery = true)
    List<UserEntity> findByCustomer(Long customerId);

    @Query(value = "select * from users u join assignment_building a on u.id = a.staff_id where a.building_id = ?1",nativeQuery = true)
    List<UserEntity> findByBuilding(Long buildingId);
}
