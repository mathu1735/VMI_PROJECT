package com.vmi.web;
import com.vmi.domain.EstimateUsage;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;

@RequestMapping("/estimateusages")
@Controller
@RooWebScaffold(path = "estimateusages", formBackingObject = EstimateUsage.class)
@RooWebJson(jsonObject = EstimateUsage.class)
public class EstimateUsageController {
}
