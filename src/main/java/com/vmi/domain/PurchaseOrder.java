package com.vmi.domain;
import com.vmi.base.BaseEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import org.springframework.roo.addon.json.RooJson;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(inheritanceType = "TABLE_PER_CLASS")
@RooJson(deepSerialize = true)
public class PurchaseOrder extends BaseEntity {

    /**
     */
    private Double POQuantity;

    /**
     */
    private String POCode;

    /**
     */
    private Double POCurrentQuantity;

    /**
     */
    private Double POUsageQuantity;

    /**
     */
    private String POActive;
}
