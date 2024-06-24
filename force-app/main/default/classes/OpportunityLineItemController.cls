public with sharing class OpportunityLineItemController {
    @AuraEnabled(cacheable=true)
    public static List<OpportunityLineItem> getOpportunityLineItems() {
        return [SELECT Quantity, UnitPrice, TotalPrice,PricebookEntry.Product2.Name FROM OpportunityLineItem LIMIT 10];
    }

    @AuraEnabled
    public static void insertOpportunityLineItem() {
        OpportunityLineItem oli = new OpportunityLineItem(
            OpportunityId = '0065g00000aanOjAAI',  // Specify the actual OpportunityId                                      
            Quantity = 1
        );

        insert oli;
    }
}