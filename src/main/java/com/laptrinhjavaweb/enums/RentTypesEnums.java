package com.laptrinhjavaweb.enums;

public enum RentTypesEnums {
    TANG_TRET("Tầng Trệt"),
    NGUYEN_CAN("Nguyên Căn"),
    NOI_THAT("Nội Thất");

    private final String rentTypeValue;

    RentTypesEnums(String rentTypeValue) {
        this.rentTypeValue = rentTypeValue;
    }

    public String getRentTypeValue() {
        return rentTypeValue;
    }
}
