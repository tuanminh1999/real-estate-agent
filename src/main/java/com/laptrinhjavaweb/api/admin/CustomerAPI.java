package com.laptrinhjavaweb.api.admin;

import com.laptrinhjavaweb.dto.AssignmentCustomerDTO;
import com.laptrinhjavaweb.dto.CustomerDTO;
import com.laptrinhjavaweb.dto.UserDTO;
import com.laptrinhjavaweb.service.IAssignmentCustomerService;
import com.laptrinhjavaweb.service.ICustomerService;
import com.laptrinhjavaweb.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("api/customers")
public class CustomerAPI {

    @Autowired
    private IUserService userService;

    @Autowired
    private ICustomerService customerService;

    @Autowired
    private IAssignmentCustomerService assignmentCustomerService;

    @PostMapping
    public CustomerDTO saveUser(@RequestBody CustomerDTO customerDTO) {
        return customerService.saveCustomer(customerDTO);
    }

    @PutMapping
    public CustomerDTO updateUser(@RequestBody CustomerDTO customerDTO) {
        return customerService.saveCustomer(customerDTO);
    }

    @DeleteMapping
    public void deleteCustomers(@RequestBody Long[] idList) {
        if (idList.length > 0) {
            customerService.deleteCustomers(idList);
        }
    }

    @GetMapping("/status")
    public List<CustomerDTO> getStatus(@RequestParam Long id) {
        return customerService.getAndCheckStatusByList(id);
    }

    @PutMapping("/updateStatus")
    public CustomerDTO updateStatus(@RequestBody CustomerDTO customerDTO){
        return customerService.updateStatus(customerDTO);
    }

    @GetMapping(value = "/{id}/staffs")
    public List<UserDTO> showStaffs(@PathVariable Long id){
        return userService.findByRoleCustomers((long) 2,id);
    }

    @PostMapping("/assignCustomer")
    public String assignBuilding(@RequestBody AssignmentCustomerDTO responseDTO){
        List<AssignmentCustomerDTO> list = assignmentCustomerService.save(responseDTO);
        if (list != null){
            return "success";
        }
        return "fail";
    }

}
