package com.laptrinhjavaweb.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UserController {

    @RequestMapping(value="/admin/user-list")
    public ModelAndView userList(){
        ModelAndView modelAndView = new ModelAndView("admin/user/list");
        return modelAndView;
    }

    @RequestMapping(value="/admin/user-edit")
    public ModelAndView userEdit(){
        ModelAndView modelAndView = new ModelAndView("admin/user/edit");
        return modelAndView;
    }
}
