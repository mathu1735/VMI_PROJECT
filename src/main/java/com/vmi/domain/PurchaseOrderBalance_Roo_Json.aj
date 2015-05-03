// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.vmi.domain;

import com.vmi.domain.PurchaseOrderBalance;
import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

privileged aspect PurchaseOrderBalance_Roo_Json {
    
    public String PurchaseOrderBalance.toJson() {
        return new JSONSerializer()
        .exclude("*.class").deepSerialize(this);
    }
    
    public String PurchaseOrderBalance.toJson(String[] fields) {
        return new JSONSerializer()
        .include(fields).exclude("*.class").deepSerialize(this);
    }
    
    public static PurchaseOrderBalance PurchaseOrderBalance.fromJsonToPurchaseOrderBalance(String json) {
        return new JSONDeserializer<PurchaseOrderBalance>()
        .use(null, PurchaseOrderBalance.class).deserialize(json);
    }
    
    public static String PurchaseOrderBalance.toJsonArray(Collection<PurchaseOrderBalance> collection) {
        return new JSONSerializer()
        .exclude("*.class").deepSerialize(collection);
    }
    
    public static String PurchaseOrderBalance.toJsonArray(Collection<PurchaseOrderBalance> collection, String[] fields) {
        return new JSONSerializer()
        .include(fields).exclude("*.class").deepSerialize(collection);
    }
    
    public static Collection<PurchaseOrderBalance> PurchaseOrderBalance.fromJsonArrayToPurchaseOrderBalances(String json) {
        return new JSONDeserializer<List<PurchaseOrderBalance>>()
        .use("values", PurchaseOrderBalance.class).deserialize(json);
    }
    
}
