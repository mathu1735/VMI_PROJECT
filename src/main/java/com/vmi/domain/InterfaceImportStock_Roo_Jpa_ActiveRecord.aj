// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.vmi.domain;

import com.vmi.domain.InterfaceImportStock;
import java.util.List;
import org.springframework.transaction.annotation.Transactional;

privileged aspect InterfaceImportStock_Roo_Jpa_ActiveRecord {
    
    public static final List<String> InterfaceImportStock.fieldNames4OrderClauseFilter = java.util.Arrays.asList("InfDate", "InfLocationCode", "InfMovementType", "InfRefPO", "InfQuantity");
    
    public static long InterfaceImportStock.countInterfaceImportStocks() {
        return entityManager().createQuery("SELECT COUNT(o) FROM InterfaceImportStock o", Long.class).getSingleResult();
    }
    
    public static List<InterfaceImportStock> InterfaceImportStock.findAllInterfaceImportStocks() {
        return entityManager().createQuery("SELECT o FROM InterfaceImportStock o", InterfaceImportStock.class).getResultList();
    }
    
    public static List<InterfaceImportStock> InterfaceImportStock.findAllInterfaceImportStocks(String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM InterfaceImportStock o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, InterfaceImportStock.class).getResultList();
    }
    
    public static InterfaceImportStock InterfaceImportStock.findInterfaceImportStock(Long id) {
        if (id == null) return null;
        return entityManager().find(InterfaceImportStock.class, id);
    }
    
    public static List<InterfaceImportStock> InterfaceImportStock.findInterfaceImportStockEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM InterfaceImportStock o", InterfaceImportStock.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    public static List<InterfaceImportStock> InterfaceImportStock.findInterfaceImportStockEntries(int firstResult, int maxResults, String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM InterfaceImportStock o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, InterfaceImportStock.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public InterfaceImportStock InterfaceImportStock.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        InterfaceImportStock merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
