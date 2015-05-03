package com.vmi.web;
import com.vmi.domain.InterfaceImportStock;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;

@RequestMapping("/interfaceimportstocks")
@Controller
@RooWebScaffold(path = "interfaceimportstocks", formBackingObject = InterfaceImportStock.class)
@RooWebJson(jsonObject = InterfaceImportStock.class)
public class InterfaceImportStockController {
}
