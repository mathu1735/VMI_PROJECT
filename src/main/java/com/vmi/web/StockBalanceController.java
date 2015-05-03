package com.vmi.web;
import com.vmi.domain.StockBalance;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;

@RequestMapping("/stockbalances")
@Controller
@RooWebScaffold(path = "stockbalances", formBackingObject = StockBalance.class)
@RooWebJson(jsonObject = StockBalance.class)
public class StockBalanceController {
}
