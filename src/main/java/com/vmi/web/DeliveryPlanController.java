package com.vmi.web;
import com.vmi.domain.DeliveryPlan;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;

@RequestMapping("/deliveryplans")
@Controller
@RooWebScaffold(path = "deliveryplans", formBackingObject = DeliveryPlan.class)
@RooWebJson(jsonObject = DeliveryPlan.class)
public class DeliveryPlanController {
}
