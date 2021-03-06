// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.vmi.domain;

import com.vmi.domain.DeliveryPlan;
import java.util.List;
import org.springframework.transaction.annotation.Transactional;

privileged aspect DeliveryPlan_Roo_Jpa_ActiveRecord {
    
    public static final List<String> DeliveryPlan.fieldNames4OrderClauseFilter = java.util.Arrays.asList("DeliDate", "DeliQuantity", "DeliPOCode", "DeliStatus");
    
    public static long DeliveryPlan.countDeliveryPlans() {
        return entityManager().createQuery("SELECT COUNT(o) FROM DeliveryPlan o", Long.class).getSingleResult();
    }
    
    public static List<DeliveryPlan> DeliveryPlan.findAllDeliveryPlans() {
        return entityManager().createQuery("SELECT o FROM DeliveryPlan o", DeliveryPlan.class).getResultList();
    }
    
    public static List<DeliveryPlan> DeliveryPlan.findAllDeliveryPlans(String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM DeliveryPlan o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, DeliveryPlan.class).getResultList();
    }
    
    public static DeliveryPlan DeliveryPlan.findDeliveryPlan(Long id) {
        if (id == null) return null;
        return entityManager().find(DeliveryPlan.class, id);
    }
    
    public static List<DeliveryPlan> DeliveryPlan.findDeliveryPlanEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM DeliveryPlan o", DeliveryPlan.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    public static List<DeliveryPlan> DeliveryPlan.findDeliveryPlanEntries(int firstResult, int maxResults, String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM DeliveryPlan o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, DeliveryPlan.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public DeliveryPlan DeliveryPlan.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        DeliveryPlan merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
