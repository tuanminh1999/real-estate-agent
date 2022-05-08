package com.laptrinhjavaweb.controller.admin;

import com.laptrinhjavaweb.service.ICustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CustomerController {

    @Autowired
    private ICustomerService customerService;

    @RequestMapping(value="/admin/customer-list")
    public ModelAndView showCustomerList(){
        ModelAndView modelAndView = new ModelAndView("admin/customer/list");
        modelAndView.addObject("customers", customerService.findAll());
        modelAndView.addObject("status", customerService.getStatusCustomer());
        return modelAndView;
    }

    @RequestMapping(value="/admin/customer-add")
    public ModelAndView addCustomer(){
        ModelAndView modelAndView = new ModelAndView("admin/customer/edit");
        return modelAndView;
    }

    @RequestMapping(value="/admin/customer-edit-{id}")
    public ModelAndView editCustomer(@PathVariable Long id){
        ModelAndView modelAndView = new ModelAndView("admin/customer/edit");
        modelAndView.addObject("customer", customerService.findById(id));
        return modelAndView;
    }
}
