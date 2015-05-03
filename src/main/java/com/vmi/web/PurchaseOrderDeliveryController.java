package com.vmi.web;
import com.vmi.domain.PurchaseOrderDelivery;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;

@RequestMapping("/purchaseorderdeliverys")
@Controller
@RooWebScaffold(path = "purchaseorderdeliverys", formBackingObject = PurchaseOrderDelivery.class)
@RooWebJson(jsonObject = PurchaseOrderDelivery.class)
public class PurchaseOrderDeliveryController {
}
