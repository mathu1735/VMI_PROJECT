// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.vmi.domain;

import com.vmi.domain.Item;
import com.vmi.domain.StockLocation;

privileged aspect StockLocation_Roo_JavaBean {
    
    public String StockLocation.getSLocName() {
        return this.SLocName;
    }
    
    public void StockLocation.setSLocName(String SLocName) {
        this.SLocName = SLocName;
    }
    
    public String StockLocation.getSLocCode() {
        return this.SLocCode;
    }
    
    public void StockLocation.setSLocCode(String SLocCode) {
        this.SLocCode = SLocCode;
    }
    
    public Double StockLocation.getSLocCurrentQuantity() {
        return this.SLocCurrentQuantity;
    }
    
    public void StockLocation.setSLocCurrentQuantity(Double SLocCurrentQuantity) {
        this.SLocCurrentQuantity = SLocCurrentQuantity;
    }
    
    public Integer StockLocation.getSLocMin() {
        return this.SLocMin;
    }
    
    public void StockLocation.setSLocMin(Integer SLocMin) {
        this.SLocMin = SLocMin;
    }
    
    public Integer StockLocation.getSLocMax() {
        return this.SLocMax;
    }
    
    public void StockLocation.setSLocMax(Integer SLocMax) {
        this.SLocMax = SLocMax;
    }
    
    public Item StockLocation.getItemCode() {
        return this.ItemCode;
    }
    
    public void StockLocation.setItemCode(Item ItemCode) {
        this.ItemCode = ItemCode;
    }
    
}
