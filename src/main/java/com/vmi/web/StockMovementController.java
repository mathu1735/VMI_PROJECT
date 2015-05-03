package com.vmi.web;
import com.vmi.domain.StockMovement;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;

@RequestMapping("/stockmovements")
@Controller
@RooWebScaffold(path = "stockmovements", formBackingObject = StockMovement.class)
@RooWebJson(jsonObject = StockMovement.class)
public class StockMovementController {
}
