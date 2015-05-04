package com.vmi.entity;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/roleses")
@Controller
@RooWebScaffold(path = "roleses", formBackingObject = Roles.class)
public class RolesController {
}
