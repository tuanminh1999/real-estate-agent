package com.laptrinhjavaweb.dto;

public class AssignmentCustomerDTO extends AbstractDTO {

    private Long[] staffs;
    private Long customerId;

    public Long[] getStaffs() {
        return staffs;
    }

    public void setStaffs(Long[] staffs) {
        this.staffs = staffs;
    }

    public Long getCustomerId() {
        return customerId;
    }

    public void setCustomerId(Long customerId) {
        this.customerId = customerId;
    }
}
