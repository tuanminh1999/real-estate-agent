package com.laptrinhjavaweb.api.admin;

import com.laptrinhjavaweb.dto.CustomerDTO;
import com.laptrinhjavaweb.dto.UserDTO;
import com.laptrinhjavaweb.service.ICustomerService;
import com.laptrinhjavaweb.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("api/customers")
public class CustomerAPI {

    @Autowired
    private ICustomerService customerService;

    @PostMapping
    public CustomerDTO saveUser(@RequestBody CustomerDTO customerDTO) {
        return customerService.saveCustomer(customerDTO);
    }

    @PutMapping
    public CustomerDTO updateUser(@RequestBody CustomerDTO customerDTO) {
        return customerService.saveCustomer(customerDTO);
    }

    @DeleteMapping
    public void deleteBuilding(@RequestBody Long[] idList) {
        if (idList.length > 0) {
            customerService.deleteCustomers(idList);
        }
    }
}
