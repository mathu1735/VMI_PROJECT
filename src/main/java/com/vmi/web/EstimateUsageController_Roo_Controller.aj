// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.vmi.web;

import com.vmi.domain.EstimateUsage;
import com.vmi.web.EstimateUsageController;
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

privileged aspect EstimateUsageController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String EstimateUsageController.create(@Valid EstimateUsage estimateUsage, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, estimateUsage);
            return "estimateusages/create";
        }
        uiModel.asMap().clear();
        estimateUsage.persist();
        return "redirect:/estimateusages/" + encodeUrlPathSegment(estimateUsage.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String EstimateUsageController.createForm(Model uiModel) {
        populateEditForm(uiModel, new EstimateUsage());
        return "estimateusages/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String EstimateUsageController.show(@PathVariable("id") Long id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("estimateusage", EstimateUsage.findEstimateUsage(id));
        uiModel.addAttribute("itemId", id);
        return "estimateusages/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String EstimateUsageController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("estimateusages", EstimateUsage.findEstimateUsageEntries(firstResult, sizeNo, sortFieldName, sortOrder));
            float nrOfPages = (float) EstimateUsage.countEstimateUsages() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("estimateusages", EstimateUsage.findAllEstimateUsages(sortFieldName, sortOrder));
        }
        addDateTimeFormatPatterns(uiModel);
        return "estimateusages/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String EstimateUsageController.update(@Valid EstimateUsage estimateUsage, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, estimateUsage);
            return "estimateusages/update";
        }
        uiModel.asMap().clear();
        estimateUsage.merge();
        return "redirect:/estimateusages/" + encodeUrlPathSegment(estimateUsage.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String EstimateUsageController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, EstimateUsage.findEstimateUsage(id));
        return "estimateusages/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String EstimateUsageController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        EstimateUsage estimateUsage = EstimateUsage.findEstimateUsage(id);
        estimateUsage.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/estimateusages";
    }
    
    void EstimateUsageController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("estimateUsage_createddate_date_format", "dd/MM/yyyy");
        uiModel.addAttribute("estimateUsage_updateddate_date_format", "dd/MM/yyyy");
        uiModel.addAttribute("estimateUsage_estistartdate_date_format", "dd/MM/yyyy");
    }
    
    void EstimateUsageController.populateEditForm(Model uiModel, EstimateUsage estimateUsage) {
        uiModel.addAttribute("estimateUsage", estimateUsage);
        addDateTimeFormatPatterns(uiModel);
    }
    
    String EstimateUsageController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
