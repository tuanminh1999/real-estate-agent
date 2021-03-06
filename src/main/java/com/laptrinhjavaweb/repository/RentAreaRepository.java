package com.laptrinhjavaweb.repository;

import com.laptrinhjavaweb.dto.RentAreaDTO;
import com.laptrinhjavaweb.entity.BuildingEntity;
import com.laptrinhjavaweb.entity.RentAreaEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RentAreaRepository extends JpaRepository<RentAreaEntity, Long> {
    @Query(value = "select * from rent_area where building_id =?1", nativeQuery = true)
    public List<RentAreaEntity> findByBuildingId(Long buildingId);

    void deleteByBuildingEntity(BuildingEntity buildingEntity);
}
