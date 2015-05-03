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

@RooJavaBean
@RooToString
@RooJpaActiveRecord(inheritanceType = "TABLE_PER_CLASS")
@RooJson(deepSerialize = true)
public class EstimateUsage extends BaseEntity {

    /**
     */
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern = "dd/MM/yyyy")
    private Date EstiStartDate;

    /**
     */
    private Double EstiQ1;

    /**
     */
    private Double EstiQ2;

    /**
     */
    private Double EstiQ3;

    /**
     */
    private Double EstiQ4;

    /**
     */
    private Double EstiQ5;

    /**
     */
    private Double EstiQ6;

    /**
     */
    private Double EstiQ7;
}
