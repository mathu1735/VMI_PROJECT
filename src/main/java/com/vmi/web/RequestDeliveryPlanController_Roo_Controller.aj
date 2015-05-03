// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.vmi.web;

import com.vmi.domain.RequestDeliveryPlan;
import com.vmi.web.RequestDeliveryPlanController;
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

privileged aspect RequestDeliveryPlanController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String RequestDeliveryPlanController.create(@Valid RequestDeliveryPlan requestDeliveryPlan, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, requestDeliveryPlan);
            return "requestdeliveryplans/create";
        }
        uiModel.asMap().clear();
        requestDeliveryPlan.persist();
        return "redirect:/requestdeliveryplans/" + encodeUrlPathSegment(requestDeliveryPlan.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String RequestDeliveryPlanController.createForm(Model uiModel) {
        populateEditForm(uiModel, new RequestDeliveryPlan());
        return "requestdeliveryplans/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String RequestDeliveryPlanController.show(@PathVariable("id") Long id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("requestdeliveryplan", RequestDeliveryPlan.findRequestDeliveryPlan(id));
        uiModel.addAttribute("itemId", id);
        return "requestdeliveryplans/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String RequestDeliveryPlanController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("requestdeliveryplans", RequestDeliveryPlan.findRequestDeliveryPlanEntries(firstResult, sizeNo, sortFieldName, sortOrder));
            float nrOfPages = (float) RequestDeliveryPlan.countRequestDeliveryPlans() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("requestdeliveryplans", RequestDeliveryPlan.findAllRequestDeliveryPlans(sortFieldName, sortOrder));
        }
        addDateTimeFormatPatterns(uiModel);
        return "requestdeliveryplans/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String RequestDeliveryPlanController.update(@Valid RequestDeliveryPlan requestDeliveryPlan, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, requestDeliveryPlan);
            return "requestdeliveryplans/update";
        }
        uiModel.asMap().clear();
        requestDeliveryPlan.merge();
        return "redirect:/requestdeliveryplans/" + encodeUrlPathSegment(requestDeliveryPlan.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String RequestDeliveryPlanController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, RequestDeliveryPlan.findRequestDeliveryPlan(id));
        return "requestdeliveryplans/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String RequestDeliveryPlanController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        RequestDeliveryPlan requestDeliveryPlan = RequestDeliveryPlan.findRequestDeliveryPlan(id);
        requestDeliveryPlan.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/requestdeliveryplans";
    }
    
    void RequestDeliveryPlanController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("requestDeliveryPlan_createddate_date_format", "dd/MM/yyyy");
        uiModel.addAttribute("requestDeliveryPlan_updateddate_date_format", "dd/MM/yyyy");
        uiModel.addAttribute("requestDeliveryPlan_reqdelirequestdate_date_format", "dd/MM/yyyy");
        uiModel.addAttribute("requestDeliveryPlan_reqdelidate_date_format", "dd/MM/yyyy");
    }
    
    void RequestDeliveryPlanController.populateEditForm(Model uiModel, RequestDeliveryPlan requestDeliveryPlan) {
        uiModel.addAttribute("requestDeliveryPlan", requestDeliveryPlan);
        addDateTimeFormatPatterns(uiModel);
    }
    
    String RequestDeliveryPlanController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
