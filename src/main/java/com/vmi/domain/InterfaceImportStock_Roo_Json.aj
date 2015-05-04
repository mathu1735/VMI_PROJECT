// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.vmi.domain;

import com.vmi.domain.InterfaceImportStock;
import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

privileged aspect InterfaceImportStock_Roo_Json {
    
    public String InterfaceImportStock.toJson() {
        return new JSONSerializer()
        .exclude("*.class").deepSerialize(this);
    }
    
    public String InterfaceImportStock.toJson(String[] fields) {
        return new JSONSerializer()
        .include(fields).exclude("*.class").deepSerialize(this);
    }
    
    public static InterfaceImportStock InterfaceImportStock.fromJsonToInterfaceImportStock(String json) {
        return new JSONDeserializer<InterfaceImportStock>()
        .use(null, InterfaceImportStock.class).deserialize(json);
    }
    
    public static String InterfaceImportStock.toJsonArray(Collection<InterfaceImportStock> collection) {
        return new JSONSerializer()
        .exclude("*.class").deepSerialize(collection);
    }
    
    public static String InterfaceImportStock.toJsonArray(Collection<InterfaceImportStock> collection, String[] fields) {
        return new JSONSerializer()
        .include(fields).exclude("*.class").deepSerialize(collection);
    }
    
    public static Collection<InterfaceImportStock> InterfaceImportStock.fromJsonArrayToInterfaceImportStocks(String json) {
        return new JSONDeserializer<List<InterfaceImportStock>>()
        .use("values", InterfaceImportStock.class).deserialize(json);
    }
    
}