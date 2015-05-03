// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.vmi.domain;

import com.vmi.domain.StockMovement;
import java.util.List;
import org.springframework.transaction.annotation.Transactional;

privileged aspect StockMovement_Roo_Jpa_ActiveRecord {
    
    public static final List<String> StockMovement.fieldNames4OrderClauseFilter = java.util.Arrays.asList("SMovStatusCode", "SMovQuantity", "SLocCode", "SMovDate", "POCode", "SMovBalance");
    
    public static long StockMovement.countStockMovements() {
        return entityManager().createQuery("SELECT COUNT(o) FROM StockMovement o", Long.class).getSingleResult();
    }
    
    public static List<StockMovement> StockMovement.findAllStockMovements() {
        return entityManager().createQuery("SELECT o FROM StockMovement o", StockMovement.class).getResultList();
    }
    
    public static List<StockMovement> StockMovement.findAllStockMovements(String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM StockMovement o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, StockMovement.class).getResultList();
    }
    
    public static StockMovement StockMovement.findStockMovement(Long id) {
        if (id == null) return null;
        return entityManager().find(StockMovement.class, id);
    }
    
    public static List<StockMovement> StockMovement.findStockMovementEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM StockMovement o", StockMovement.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    public static List<StockMovement> StockMovement.findStockMovementEntries(int firstResult, int maxResults, String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM StockMovement o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, StockMovement.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public StockMovement StockMovement.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        StockMovement merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
