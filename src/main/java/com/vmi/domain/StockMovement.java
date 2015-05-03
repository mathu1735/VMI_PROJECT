package com.vmi.domain;
import com.vmi.base.BaseEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import java.util.Date;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.roo.addon.json.RooJson;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.OneToMany;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(inheritanceType = "TABLE_PER_CLASS")
@RooJson(deepSerialize = true)
public class StockMovement extends BaseEntity {

    /**
     */
    private String SMovStatusCode;

    /**
     */
    private Double SMovQuantity;

    /**
     */
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "SLocCode")
    private StockLocation SLocCode;

    /**
     */
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern = "dd.MM.yyyy")
    private Date SMovDate;

    /**
     */
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "POCode")
    private PurchaseOrder POCode;

    /**
     */
    private Double SMovBalance;
}
