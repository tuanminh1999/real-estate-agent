package com.laptrinhjavaweb.controller.admin;

import com.laptrinhjavaweb.service.IBuildingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller(value = "buildingControllerOfAdmin")
public class BuildingController {

    @Autowired
    private IBuildingService buildingService;

    @RequestMapping(value = "/admin/building-list", method = RequestMethod.GET)
    public ModelAndView showBuldingList(){
        ModelAndView modelAndView = new ModelAndView("admin/building/list");
        modelAndView.addObject("districtsEnums", buildingService.getDistricts());
        modelAndView.addObject("rentTypesEnums", buildingService.getRentTypes());
        return modelAndView;
    }

    @RequestMapping(value = "/admin/building-edit")
    public ModelAndView editBuilding(){
        ModelAndView modelAndView = new ModelAndView("admin/building/edit");
        modelAndView.addObject("districtsEnums", buildingService.getDistricts());
        return modelAndView;
    }

}
