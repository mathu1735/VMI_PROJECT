package com.vmi.web;
import com.vmi.domain.PurchaseOrderBalance;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;

@RequestMapping("/purchaseorderbalances")
@Controller
@RooWebScaffold(path = "purchaseorderbalances", formBackingObject = PurchaseOrderBalance.class)
@RooWebJson(jsonObject = PurchaseOrderBalance.class)
public class PurchaseOrderBalanceController {
}
