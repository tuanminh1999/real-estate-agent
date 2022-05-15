package com.laptrinhjavaweb.controller.admin;

import com.laptrinhjavaweb.dto.BuildingDTO;
import com.laptrinhjavaweb.dto.requestDTO.BuildingRequestDTO;
import com.laptrinhjavaweb.service.IBuildingService;
import com.laptrinhjavaweb.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller(value = "buildingControllerOfAdmin")
public class BuildingController {

    @Autowired
    private IBuildingService buildingService;

    @Autowired
    private IUserService userService;

    @RequestMapping(value = "/admin/building-list", method = RequestMethod.GET)
    public ModelAndView showBuldingList(){
        ModelAndView modelAndView = new ModelAndView("admin/building/list");
        modelAndView.addObject("staffs", userService.findByRoleBuidlings((long)2, (long)0));
        modelAndView.addObject("districtsEnums", buildingService.getDistricts());
        modelAndView.addObject("rentTypesEnums", buildingService.getRentTypes());
        modelAndView.addObject("buildings", buildingService.findAll());
        return modelAndView;
    }

    @RequestMapping(value = "/admin/building-add")
    public ModelAndView addBuilding(){
        ModelAndView modelAndView = new ModelAndView("admin/building/edit");
        modelAndView.addObject("districtsEnums", buildingService.getDistricts());
        modelAndView.addObject("rentTypesEnums",buildingService.getRentTypes());
        return modelAndView;
    }

    @RequestMapping(value = "/admin/building-edit-{id}")
    public ModelAndView editBuilding(@PathVariable Long id){
        ModelAndView modelAndView = new ModelAndView("admin/building/edit");
        modelAndView.addObject("districtsEnums", buildingService.getDistricts());
        modelAndView.addObject("rentTypesEnums",buildingService.getRentTypes());
        modelAndView.addObject("building", buildingService.findById(id));
        return modelAndView;
    }

    @RequestMapping(value = "/admin/building-list", method = RequestMethod.POST)
    public ModelAndView buildingListPost(BuildingRequestDTO buildingRequestDTO){
        ModelAndView modelAndView = new ModelAndView("admin/building/list");
        modelAndView.addObject("staffs", userService.findByRoleBuidlings((long)2, (long)0));
        modelAndView.addObject("districtsEnums", buildingService.getDistricts());
        modelAndView.addObject("rentTypesEnums", buildingService.getRentTypes());
        modelAndView.addObject("buildings", buildingService.findBuildingsWithJPA(buildingRequestDTO));

        return modelAndView;
    }


}
