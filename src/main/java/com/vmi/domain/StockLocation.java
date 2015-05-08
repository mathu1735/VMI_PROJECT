package com.vmi.domain;
import com.vmi.base.BaseEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import org.springframework.roo.addon.json.RooJson;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(inheritanceType = "TABLE_PER_CLASS")
@RooJson(deepSerialize = true)
public class StockLocation extends BaseEntity {

    /**
     */
    private String SLocName;

    /**
     */
    private String SLocCode;

    /**
     */
    private Double SLocCurrentQuantity;

    /**
     */
    private Integer SLocMin;

    /**
     */
    private Integer SLocMax;

    /**
     */
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "ItemCode")
    private Item ItemCode;

    /**
     */
    private String SLocAddress;
}
