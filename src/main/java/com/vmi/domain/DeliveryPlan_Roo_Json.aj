// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.vmi.domain;

import com.vmi.domain.DeliveryPlan;
import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

privileged aspect DeliveryPlan_Roo_Json {
    
    public String DeliveryPlan.toJson() {
        return new JSONSerializer()
        .exclude("*.class").deepSerialize(this);
    }
    
    public String DeliveryPlan.toJson(String[] fields) {
        return new JSONSerializer()
        .include(fields).exclude("*.class").deepSerialize(this);
    }
    
    public static DeliveryPlan DeliveryPlan.fromJsonToDeliveryPlan(String json) {
        return new JSONDeserializer<DeliveryPlan>()
        .use(null, DeliveryPlan.class).deserialize(json);
    }
    
    public static String DeliveryPlan.toJsonArray(Collection<DeliveryPlan> collection) {
        return new JSONSerializer()
        .exclude("*.class").deepSerialize(collection);
    }
    
    public static String DeliveryPlan.toJsonArray(Collection<DeliveryPlan> collection, String[] fields) {
        return new JSONSerializer()
        .include(fields).exclude("*.class").deepSerialize(collection);
    }
    
    public static Collection<DeliveryPlan> DeliveryPlan.fromJsonArrayToDeliveryPlans(String json) {
        return new JSONDeserializer<List<DeliveryPlan>>()
        .use("values", DeliveryPlan.class).deserialize(json);
    }
    
}
