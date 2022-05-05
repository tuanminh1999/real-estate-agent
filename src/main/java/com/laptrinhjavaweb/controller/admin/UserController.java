package com.laptrinhjavaweb.controller.admin;

import com.laptrinhjavaweb.service.IRoleService;
import com.laptrinhjavaweb.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UserController {

    @Autowired
    private IUserService userService;

    @Autowired
    private IRoleService roleService;

    @RequestMapping(value="/admin/user-list")
    public ModelAndView showUserList(){
        ModelAndView modelAndView = new ModelAndView("admin/user/list");
        return modelAndView;
    }

    @RequestMapping(value="/admin/user-add")
    public ModelAndView addUser(){
        ModelAndView modelAndView = new ModelAndView("admin/user/edit");
        modelAndView.addObject("roles", roleService.getRoles());
        return modelAndView;
    }

    @RequestMapping(value="/admin/user-edit-{id}")
    public ModelAndView editUser(@PathVariable Long id){
        ModelAndView modelAndView = new ModelAndView("admin/user/edit");
        modelAndView.addObject("roles", roleService.getRoles());
        return modelAndView;
    }
}
