// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.vmi.domain;

import com.vmi.domain.StockLocation;
import javax.persistence.Entity;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;

privileged aspect StockLocation_Roo_Jpa_Entity {
    
    declare @type: StockLocation: @Entity;
    
    declare @type: StockLocation: @Inheritance(strategy = InheritanceType.TABLE_PER_CLASS);
    
}
