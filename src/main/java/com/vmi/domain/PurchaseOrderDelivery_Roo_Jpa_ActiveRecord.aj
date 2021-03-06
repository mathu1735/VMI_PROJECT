// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.vmi.domain;

import com.vmi.domain.PurchaseOrderDelivery;
import java.util.List;
import org.springframework.transaction.annotation.Transactional;

privileged aspect PurchaseOrderDelivery_Roo_Jpa_ActiveRecord {
    
    public static final List<String> PurchaseOrderDelivery.fieldNames4OrderClauseFilter = java.util.Arrays.asList("PODRequestQuantity", "PODReqQuantity", "PODRecQuantity", "PODRecDate", "PODReqDate", "POCode");
    
    public static long PurchaseOrderDelivery.countPurchaseOrderDeliverys() {
        return entityManager().createQuery("SELECT COUNT(o) FROM PurchaseOrderDelivery o", Long.class).getSingleResult();
    }
    
    public static List<PurchaseOrderDelivery> PurchaseOrderDelivery.findAllPurchaseOrderDeliverys() {
        return entityManager().createQuery("SELECT o FROM PurchaseOrderDelivery o", PurchaseOrderDelivery.class).getResultList();
    }
    
    public static List<PurchaseOrderDelivery> PurchaseOrderDelivery.findAllPurchaseOrderDeliverys(String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM PurchaseOrderDelivery o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, PurchaseOrderDelivery.class).getResultList();
    }
    
    public static PurchaseOrderDelivery PurchaseOrderDelivery.findPurchaseOrderDelivery(Long id) {
        if (id == null) return null;
        return entityManager().find(PurchaseOrderDelivery.class, id);
    }
    
    public static List<PurchaseOrderDelivery> PurchaseOrderDelivery.findPurchaseOrderDeliveryEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM PurchaseOrderDelivery o", PurchaseOrderDelivery.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    public static List<PurchaseOrderDelivery> PurchaseOrderDelivery.findPurchaseOrderDeliveryEntries(int firstResult, int maxResults, String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM PurchaseOrderDelivery o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, PurchaseOrderDelivery.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public PurchaseOrderDelivery PurchaseOrderDelivery.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        PurchaseOrderDelivery merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
