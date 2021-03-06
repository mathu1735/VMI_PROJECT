package com.vmi.web;

import com.vmi.domain.*;
import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;
import java.util.List;

privileged aspect DeliveryPlanController_Custom_Controller {
    
    @RequestMapping(value = "/Plan", produces = "text/html")
    public String DeliveryPlanController.addPlan(Model uiModel) {
        

        return "deliveryplans/Plan";
    }
}