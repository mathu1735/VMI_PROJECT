package com.vmi.web;
import com.vmi.domain.StockLocation;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;

@RequestMapping("/stocklocations")
@Controller
@RooWebScaffold(path = "stocklocations", formBackingObject = StockLocation.class)
@RooWebJson(jsonObject = StockLocation.class)
public class StockLocationController {
}
