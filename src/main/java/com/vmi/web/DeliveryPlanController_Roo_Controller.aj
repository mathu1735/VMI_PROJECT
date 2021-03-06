// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.vmi.web;

import com.vmi.domain.DeliveryPlan;
import com.vmi.web.DeliveryPlanController;
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

privileged aspect DeliveryPlanController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String DeliveryPlanController.create(@Valid DeliveryPlan deliveryPlan, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, deliveryPlan);
            return "deliveryplans/create";
        }
        uiModel.asMap().clear();
        deliveryPlan.persist();
        return "redirect:/deliveryplans/" + encodeUrlPathSegment(deliveryPlan.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String DeliveryPlanController.createForm(Model uiModel) {
        populateEditForm(uiModel, new DeliveryPlan());
        return "deliveryplans/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String DeliveryPlanController.show(@PathVariable("id") Long id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("deliveryplan", DeliveryPlan.findDeliveryPlan(id));
        uiModel.addAttribute("itemId", id);
        return "deliveryplans/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String DeliveryPlanController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("deliveryplans", DeliveryPlan.findDeliveryPlanEntries(firstResult, sizeNo, sortFieldName, sortOrder));
            float nrOfPages = (float) DeliveryPlan.countDeliveryPlans() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("deliveryplans", DeliveryPlan.findAllDeliveryPlans(sortFieldName, sortOrder));
        }
        addDateTimeFormatPatterns(uiModel);
        return "deliveryplans/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String DeliveryPlanController.update(@Valid DeliveryPlan deliveryPlan, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, deliveryPlan);
            return "deliveryplans/update";
        }
        uiModel.asMap().clear();
        deliveryPlan.merge();
        return "redirect:/deliveryplans/" + encodeUrlPathSegment(deliveryPlan.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String DeliveryPlanController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, DeliveryPlan.findDeliveryPlan(id));
        return "deliveryplans/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String DeliveryPlanController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        DeliveryPlan deliveryPlan = DeliveryPlan.findDeliveryPlan(id);
        deliveryPlan.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/deliveryplans";
    }
    
    void DeliveryPlanController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("deliveryPlan_createddate_date_format", "dd/MM/yyyy");
        uiModel.addAttribute("deliveryPlan_updateddate_date_format", "dd/MM/yyyy");
        uiModel.addAttribute("deliveryPlan_delidate_date_format", "dd/MM/yyyy");
    }
    
    void DeliveryPlanController.populateEditForm(Model uiModel, DeliveryPlan deliveryPlan) {
        uiModel.addAttribute("deliveryPlan", deliveryPlan);
        addDateTimeFormatPatterns(uiModel);
    }
    
    String DeliveryPlanController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        } catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}
