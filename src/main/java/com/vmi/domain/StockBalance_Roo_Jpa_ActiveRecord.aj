// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.vmi.domain;

import com.vmi.domain.StockBalance;
import java.util.List;
import org.springframework.transaction.annotation.Transactional;

privileged aspect StockBalance_Roo_Jpa_ActiveRecord {
    
    public static final List<String> StockBalance.fieldNames4OrderClauseFilter = java.util.Arrays.asList("SBalDate", "SBalQuantity", "SBalLocationCode");
    
    public static long StockBalance.countStockBalances() {
        return entityManager().createQuery("SELECT COUNT(o) FROM StockBalance o", Long.class).getSingleResult();
    }
    
    public static List<StockBalance> StockBalance.findAllStockBalances() {
        return entityManager().createQuery("SELECT o FROM StockBalance o", StockBalance.class).getResultList();
    }
    
    public static List<StockBalance> StockBalance.findAllStockBalances(String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM StockBalance o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, StockBalance.class).getResultList();
    }
    
    public static StockBalance StockBalance.findStockBalance(Long id) {
        if (id == null) return null;
        return entityManager().find(StockBalance.class, id);
    }
    
    public static List<StockBalance> StockBalance.findStockBalanceEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM StockBalance o", StockBalance.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    public static List<StockBalance> StockBalance.findStockBalanceEntries(int firstResult, int maxResults, String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM StockBalance o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, StockBalance.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public StockBalance StockBalance.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        StockBalance merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
