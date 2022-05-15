package com.laptrinhjavaweb.repository.custom.impl;

import com.laptrinhjavaweb.dto.requestDTO.BuildingRequestDTO;
import com.laptrinhjavaweb.entity.BuildingEntity;
import com.laptrinhjavaweb.repository.custom.IBuildingRepositoryCustom;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import java.util.List;

@Repository
public class BuildingRepositoryCustomImpl implements IBuildingRepositoryCustom {

    @Autowired
    private EntityManager entityManager;

    @Override
    public List<BuildingEntity> findBuildingsWithJPA(BuildingRequestDTO model) {
        StringBuilder sql = buildBuildingSearch(model);
        Query query = entityManager.createNativeQuery(String.valueOf(sql), BuildingEntity.class);

        return query.getResultList();
    }

    private StringBuilder buildBuildingSearch(BuildingRequestDTO model) {
        StringBuilder sql = new StringBuilder("select * from building as b ");
        StringBuilder sqlName = new StringBuilder();
        StringBuilder sqlStaff = new StringBuilder();
        StringBuilder sqlStaffId = new StringBuilder();
        StringBuilder sqlFloorArea = new StringBuilder();
        StringBuilder sqlNumberOfBasement = new StringBuilder();
        StringBuilder sqlDistrict = new StringBuilder();
        StringBuilder sqlWard = new StringBuilder();
        StringBuilder sqlStreet = new StringBuilder();
        StringBuilder sqlRentArea = new StringBuilder();
        StringBuilder sqlRentPrice = new StringBuilder();
        StringBuilder sqlManagerName = new StringBuilder();
        StringBuilder sqlManagerPhone = new StringBuilder();
        StringBuilder sqlDirection = new StringBuilder();
        StringBuilder sqlLevel = new StringBuilder();
        StringBuilder sqlTyle = new StringBuilder();

        if(model.getName() != null && !model.getName().isEmpty()){
            sqlName.append(" and b.name like '%" + model.getName() + "%' ");
        }
        if (model.getStaffId() != null && !model.getStaffId().isEmpty()) {
            sqlStaff.append("left join assignment_building ab on ab.building_id = b.id");
            sqlStaffId.append(" and ab.staff_id =" + model.getStaffId());
        }
        if (model.getFloorArea() != null) {
            sqlFloorArea.append(" and b.floor_area = " + model.getFloorArea());
        }
        if (model.getDistrict() != null && !model.getDistrict().isEmpty()) {
            sqlDistrict.append(" and b.district like '%" + model.getDistrict() + "%'");
        }
        if (model.getWard() != null && !model.getWard().isEmpty()) {
            sqlWard.append(" and b.ward like '%" + model.getWard() + "%'");
        }
        if (model.getStreet() != null && !model.getStreet().isEmpty()) {
            sqlStreet.append(" and b.street like '%" + model.getStreet() + "%'");
        }
        if (model.getNumberOfBasement() != null) {
            sqlNumberOfBasement.append(" and b.number_of_basement = " + model.getNumberOfBasement());
        }
        if (model.getRentAreaFrom() != null || model.getRentAreaTo() != null) {
            sqlRentArea.append(checkRentArea(model));
        }
        if (model.getRentPriceFrom() != null || model.getRentPriceTo() != null) {
            sqlRentPrice.append(checkRentPrice(model));
        }
        if (model.getManagerName() != null && !model.getManagerName().isEmpty()) {
            sqlManagerName.append(" and b.manager_name like '%" + model.getManagerName() + "%'");
        }
        if (model.getManagerPhone() != null && !model.getManagerPhone().isEmpty()) {
            sqlManagerPhone.append(" and b.manager_phone like '%" + model.getManagerPhone() + "%'");
        }
        if (model.getDirection() != null && !model.getDirection().isEmpty()) {
            sqlDirection.append(" and b.direction like '%" + model.getDirection() + "%'");
        }
        if (model.getLevel() != null && !model.getLevel().isEmpty()) {
            sqlLevel.append(" and b.level like '%" + model.getLevel() + "%'");
        }
        if (model.getRentTypes().length > 0) {
            sqlTyle.append(checkType(model));
        }

        sql.append(sqlStaff + " where 1 = 1 " + sqlName + " " + sqlStaffId + " " + sqlFloorArea + " "
                + sqlDistrict + " " + sqlWard + " " + sqlStreet + " " + sqlNumberOfBasement + " "
                + sqlRentArea + " " + sqlRentPrice + " " + sqlManagerName + " " + sqlManagerPhone + " "
                + sqlDirection + " " + sqlLevel + " " + sqlTyle);

        //Remove multiple spaces to one space in string.
        String sqlTemp = sql.toString();
        sqlTemp = sqlTemp.replaceAll("\\s+", " ");
        StringBuilder sqlResult = new StringBuilder(sqlTemp);

        return sqlResult;
    }

    private StringBuilder checkRentArea(BuildingRequestDTO model) {
        StringBuilder sqlRentArea = new StringBuilder();
        sqlRentArea.append(" AND EXISTS (SELECT * from rent_area ra where 1=1 AND ra.building_id = b.id ");
        if (model.getRentAreaFrom() != null && model.getRentAreaTo() != null) {
            sqlRentArea.append(" and ra.value >= " + model.getRentAreaFrom() + "  and ra.value <= "
                    + model.getRentAreaTo() + ")");
        } else if (model.getRentAreaFrom() != null) {
            sqlRentArea.append(" and ra.value >= " + model.getRentAreaFrom() + ")");
        } else if (model.getRentAreaTo() != null) {
            sqlRentArea.append(" and ra.value <= " + model.getRentAreaTo() + ")");
        }

        return sqlRentArea;
    }

    private String checkRentPrice(BuildingRequestDTO model) {
        String sqlRentPrice = "";

        if (model.getRentPriceFrom() != null && model.getRentPriceTo() != null) {
            sqlRentPrice = " and b.rent_price >= " + model.getRentPriceFrom() + "  and b.rent_price <= "
                    + model.getRentPriceTo();
        } else if (model.getRentPriceFrom() != null) {
            sqlRentPrice = " and b.rent_price >= " + model.getRentPriceFrom();
        } else if (model.getRentPriceTo() != null) {
            sqlRentPrice = " and b.rent_price <= " + model.getRentPriceTo();
        }

        return sqlRentPrice;
    }

    private String checkType(BuildingRequestDTO model) {
        String sqlTyle = "", sqlTyles = "";
        for (int i = 0; i < model.getRentTypes().length; i++) {
            if (i < (model.getRentTypes().length - 1)) {
                sqlTyles += "or b.type like '%" + model.getRentTypes()[i] + "%' ";
            } else {
                sqlTyle = " and (b.type like '%" + model.getRentTypes()[i] + "%' " + sqlTyles + ")";
            }
        }

        return sqlTyle;
    }

}
