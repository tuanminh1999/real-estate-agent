package com.laptrinhjavaweb.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BuildingController {

    @RequestMapping(value = "/admin/building-list", method = RequestMethod.GET)
    public ModelAndView buidlingList(){
        ModelAndView modelAndView = new ModelAndView("admin/building/list");
        return modelAndView;
    }

    @RequestMapping(value = "/admin/building-edit")
    public ModelAndView buildingEdit(){
        ModelAndView modelAndView = new ModelAndView("admin/building/edit");
        return modelAndView;
    }

}
