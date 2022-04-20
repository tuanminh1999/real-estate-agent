package com.laptrinhjavaweb.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CustomerController {

    @RequestMapping(value = "admin/customer-list", method = RequestMethod.GET)
    public ModelAndView customerList(){
        ModelAndView modelAndView = new ModelAndView("admin/customer/list");
        return modelAndView;
    }

    @RequestMapping(value = "admin/customer-edit", method = RequestMethod.GET)
    public ModelAndView customerEdit(){
        ModelAndView modelAndView = new ModelAndView("admin/customer/edit");
        return modelAndView;
    }

}
