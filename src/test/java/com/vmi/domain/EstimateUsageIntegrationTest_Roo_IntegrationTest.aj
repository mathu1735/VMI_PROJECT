// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.vmi.domain;

import com.vmi.domain.EstimateUsage;
import com.vmi.domain.EstimateUsageDataOnDemand;
import com.vmi.domain.EstimateUsageIntegrationTest;
import java.util.Iterator;
import java.util.List;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect EstimateUsageIntegrationTest_Roo_IntegrationTest {
    
    declare @type: EstimateUsageIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: EstimateUsageIntegrationTest: @ContextConfiguration(locations = "classpath*:/META-INF/spring/applicationContext*.xml");
    
    declare @type: EstimateUsageIntegrationTest: @Transactional;
    
    @Autowired
    EstimateUsageDataOnDemand EstimateUsageIntegrationTest.dod;
    
    @Test
    public void EstimateUsageIntegrationTest.testCountEstimateUsages() {
        Assert.assertNotNull("Data on demand for 'EstimateUsage' failed to initialize correctly", dod.getRandomEstimateUsage());
        long count = EstimateUsage.countEstimateUsages();
        Assert.assertTrue("Counter for 'EstimateUsage' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void EstimateUsageIntegrationTest.testFindEstimateUsage() {
        EstimateUsage obj = dod.getRandomEstimateUsage();
        Assert.assertNotNull("Data on demand for 'EstimateUsage' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'EstimateUsage' failed to provide an identifier", id);
        obj = EstimateUsage.findEstimateUsage(id);
        Assert.assertNotNull("Find method for 'EstimateUsage' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'EstimateUsage' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void EstimateUsageIntegrationTest.testFindAllEstimateUsages() {
        Assert.assertNotNull("Data on demand for 'EstimateUsage' failed to initialize correctly", dod.getRandomEstimateUsage());
        long count = EstimateUsage.countEstimateUsages();
        Assert.assertTrue("Too expensive to perform a find all test for 'EstimateUsage', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<EstimateUsage> result = EstimateUsage.findAllEstimateUsages();
        Assert.assertNotNull("Find all method for 'EstimateUsage' illegally returned null", result);
        Assert.assertTrue("Find all method for 'EstimateUsage' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void EstimateUsageIntegrationTest.testFindEstimateUsageEntries() {
        Assert.assertNotNull("Data on demand for 'EstimateUsage' failed to initialize correctly", dod.getRandomEstimateUsage());
        long count = EstimateUsage.countEstimateUsages();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<EstimateUsage> result = EstimateUsage.findEstimateUsageEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'EstimateUsage' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'EstimateUsage' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void EstimateUsageIntegrationTest.testFlush() {
        EstimateUsage obj = dod.getRandomEstimateUsage();
        Assert.assertNotNull("Data on demand for 'EstimateUsage' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'EstimateUsage' failed to provide an identifier", id);
        obj = EstimateUsage.findEstimateUsage(id);
        Assert.assertNotNull("Find method for 'EstimateUsage' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyEstimateUsage(obj);
        Integer currentVersion = obj.getVersion();
        obj.flush();
        Assert.assertTrue("Version for 'EstimateUsage' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void EstimateUsageIntegrationTest.testMergeUpdate() {
        EstimateUsage obj = dod.getRandomEstimateUsage();
        Assert.assertNotNull("Data on demand for 'EstimateUsage' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'EstimateUsage' failed to provide an identifier", id);
        obj = EstimateUsage.findEstimateUsage(id);
        boolean modified =  dod.modifyEstimateUsage(obj);
        Integer currentVersion = obj.getVersion();
        EstimateUsage merged = (EstimateUsage)obj.merge();
        obj.flush();
        Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        Assert.assertTrue("Version for 'EstimateUsage' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void EstimateUsageIntegrationTest.testPersist() {
        Assert.assertNotNull("Data on demand for 'EstimateUsage' failed to initialize correctly", dod.getRandomEstimateUsage());
        EstimateUsage obj = dod.getNewTransientEstimateUsage(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'EstimateUsage' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'EstimateUsage' identifier to be null", obj.getId());
        try {
            obj.persist();
        } catch (final ConstraintViolationException e) {
            final StringBuilder msg = new StringBuilder();
            for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                final ConstraintViolation<?> cv = iter.next();
                msg.append("[").append(cv.getRootBean().getClass().getName()).append(".").append(cv.getPropertyPath()).append(": ").append(cv.getMessage()).append(" (invalid value = ").append(cv.getInvalidValue()).append(")").append("]");
            }
            throw new IllegalStateException(msg.toString(), e);
        }
        obj.flush();
        Assert.assertNotNull("Expected 'EstimateUsage' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void EstimateUsageIntegrationTest.testRemove() {
        EstimateUsage obj = dod.getRandomEstimateUsage();
        Assert.assertNotNull("Data on demand for 'EstimateUsage' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'EstimateUsage' failed to provide an identifier", id);
        obj = EstimateUsage.findEstimateUsage(id);
        obj.remove();
        obj.flush();
        Assert.assertNull("Failed to remove 'EstimateUsage' with identifier '" + id + "'", EstimateUsage.findEstimateUsage(id));
    }
    
}
