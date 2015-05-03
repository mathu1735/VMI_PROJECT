package com.vmi.domain;
import com.vmi.base.BaseEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import java.util.Date;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.springframework.format.annotation.DateTimeFormat;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import org.springframework.roo.addon.json.RooJson;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(inheritanceType = "TABLE_PER_CLASS")
@RooJson(deepSerialize = true)
public class PurchaseOrderBalance extends BaseEntity {

    /**
     */
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern = "dd/MM/yyyy")
    private Date POBalDate;

    /**
     */
    private Double POBalQuantity;

    /**
     */
    private Double POBalUsageQuantity;

    /**
     */
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "POCode")
    private PurchaseOrder POCode;
}
