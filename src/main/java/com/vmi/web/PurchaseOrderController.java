package com.vmi.web;
import com.vmi.domain.PurchaseOrder;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;

@RequestMapping("/purchaseorders")
@Controller
@RooWebScaffold(path = "purchaseorders", formBackingObject = PurchaseOrder.class)
@RooWebJson(jsonObject = PurchaseOrder.class)
public class PurchaseOrderController {
}
