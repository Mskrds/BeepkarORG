// ProductController.cls
public with sharing class ProductControllerB {
    @AuraEnabled(cacheable=true)
    public static List<Product2> getProducts(String recId) {
        return [SELECT Id, Name,ProductCode,IsActive From Product2 limit 6];
    }
}