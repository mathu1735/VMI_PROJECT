package com.vmi.web;
import com.vmi.domain.MovementType;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;

@RequestMapping("/movementtypes")
@Controller
@RooWebScaffold(path = "movementtypes", formBackingObject = MovementType.class)
@RooWebJson(jsonObject = MovementType.class)
public class MovementTypeController {
}
