// ProductController.cls
public with sharing class ProductController {
    @AuraEnabled
    public static void createProduct(String productName, Boolean isActive) {
        // Perform the logic to insert the Product record
        Product2 prod = new Product2(
            Name = productName,
            IsActive = isActive
        );
        insert prod;
    }

    @AuraEnabled(cacheable=true)
    public static List<Product2> getProducts() {
        
        return [SELECT Id, Name, Total_Quantity__c, IsActive FROM Product2 limit 5];
    }
}