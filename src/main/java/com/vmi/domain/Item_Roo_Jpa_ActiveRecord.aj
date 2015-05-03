// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.vmi.domain;

import com.vmi.domain.Item;
import java.util.List;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Item_Roo_Jpa_ActiveRecord {
    
    public static final List<String> Item.fieldNames4OrderClauseFilter = java.util.Arrays.asList("ItemName", "ItemCode");
    
    public static long Item.countItems() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Item o", Long.class).getSingleResult();
    }
    
    public static List<Item> Item.findAllItems() {
        return entityManager().createQuery("SELECT o FROM Item o", Item.class).getResultList();
    }
    
    public static List<Item> Item.findAllItems(String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM Item o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, Item.class).getResultList();
    }
    
    public static Item Item.findItem(Long id) {
        if (id == null) return null;
        return entityManager().find(Item.class, id);
    }
    
    public static List<Item> Item.findItemEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Item o", Item.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    public static List<Item> Item.findItemEntries(int firstResult, int maxResults, String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM Item o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, Item.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public Item Item.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Item merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
