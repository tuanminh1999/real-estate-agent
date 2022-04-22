package com.laptrinhjavaweb.service.impl;

import com.laptrinhjavaweb.enums.DistrictEnums;
import com.laptrinhjavaweb.enums.RentTypesEnums;
import com.laptrinhjavaweb.service.IBuildingService;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
public class BuildingServiceImpl implements IBuildingService {
    @Override
    public Map<String, String> getDistricts() {
        Map<String, String> districts = new HashMap<>();
        for(DistrictEnums item : DistrictEnums.values()){
            districts.put(item.toString(), item.getDistricValue());
        }
        return districts;
    }

    @Override
    public Map<String, String> getRentTypes() {
        Map<String, String> rentTypes = new HashMap<>();
        for(RentTypesEnums item : RentTypesEnums.values()){
            rentTypes.put(item.toString(), item.getRentTypeValue());
        }
        return rentTypes;
    }
}
