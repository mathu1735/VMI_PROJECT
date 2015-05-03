package com.vmi.web;
import com.vmi.domain.RequestDeliveryPlan;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;

@RequestMapping("/requestdeliveryplans")
@Controller
@RooWebScaffold(path = "requestdeliveryplans", formBackingObject = RequestDeliveryPlan.class)
@RooWebJson(jsonObject = RequestDeliveryPlan.class)
public class RequestDeliveryPlanController {
}
