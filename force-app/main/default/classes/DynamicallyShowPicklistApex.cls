public class DynamicallyShowPicklistApex {
    //Method1. TO get the role__c Field picklist values of objecteD
    @AuraEnabled(cacheable=true)
    public static List<String> getrecordspicklist() {
        
        List<String> objDTypePicklistValues = new List<String>();
        
        Schema.DescribeFieldResult fieldResult = ObjectD__c.Role__c.getDescribe();
        List<Schema.PicklistEntry> picklistValues = fieldResult.getPicklistValues();
        
        for (Schema.PicklistEntry picklistEntry : picklistValues) {
            objDTypePicklistValues.add(picklistEntry.getValue());
        }
        
        return objDTypePicklistValues;
    }
    
    //Method1.2 to update the  objectd reocrd with the given picklist value
    @AuraEnabled(cacheable=true)
    public static void  updaterecordfields(String recId,String hrfirstName, String hrsecondName ){
        
        //Select id,name,Role__c, Developer_First_Name__c, Developer_Second_Name__c, Developer_Email__c, Team_Lead_First_Name__c, Team_Lead_Second_Name__c, Team_Lead_Email__c,
        // HR_First_Name__c, HR_Second_Name__c, HR_Email__c,Technical_Lead_First_Name__c, Technical_Lead_Second_Name__c FROM ObjectD__c];
        
        list<ObjectD__c> allobjectdlist = new list<ObjectD__c>();
        ObjectD__c objd = new ObjectD__c();
        objd.ID = recId;
        objd.HR_First_Name__c = hrfirstName;
        objd.HR_Second_Name__c = hrsecondName;
        // objd.Team_Lead_First_Name__c = leadFirstName;
        // objd.Team_Lead_Second_Name__c =leadsecondName;
        // objd.Developer_First_Name__c = devfirstName;
        // objd.Developer_Second_Name__c = devsecondName;
        // objd.Team_Lead_First_Name__c =  teamLeadFirstName;
        
        allobjectdlist.add(objd);
        Update allobjectdlist;     
    }
    
    //Method2. Created this method to show the week_days_c picklist field values in the LWC 
    @AuraEnabled(cacheable=true)
    public static List<String> getweekdaysfieldpicklist() {
        
        List<String> objEweekdaysPicklistValues = new List<String>();
        
        Schema.DescribeFieldResult fieldResult = ObjectE__c.Week_Days__c.getDescribe();
        List<Schema.PicklistEntry> picklistValues = fieldResult.getPicklistValues();
        
        for (Schema.PicklistEntry picklistEntry : picklistValues) {
            objEweekdaysPicklistValues.add(picklistEntry.getValue());
        }
        
        return objEweekdaysPicklistValues;
    }
    
    //Method3. Created this method to show the country and state picklist field in the LWC 
    @AuraEnabled(cacheable=true)
    public static Map<String, List<String>> getPicklistValues() {
        Map<String, List<String>> picklistValuesMap = new Map<String, List<String>>();
        
        // Fetch State picklist values
        List<String> statePicklistValues = new List<String>();
        Schema.DescribeFieldResult stateFieldResult = ObjectC__c.State__c.getDescribe(); //Uses the getDescribe method to obtain metadata information about the State__c custom field.
        List<Schema.PicklistEntry> statePicklistEntries = stateFieldResult.getPicklistValues(); //Retrieves the picklist values for the State field.
        for (Schema.PicklistEntry picklistEntry : statePicklistEntries) {
            statePicklistValues.add(picklistEntry.getValue());
        }
        picklistValuesMap.put('State values', statePicklistValues);
        System.debug('State Picklist Values: ' + statePicklistValues);
        
        
        // Fetch Country picklist values
        List<String> countryPicklistValues = new List<String>();
        Schema.DescribeFieldResult countryFieldResult = ObjectC__c.Country__c.getDescribe();
        List<Schema.PicklistEntry> countryPicklistEntries = countryFieldResult.getPicklistValues();
        for (Schema.PicklistEntry picklistEntry : countryPicklistEntries) {
            countryPicklistValues.add(picklistEntry.getValue());
        }
        picklistValuesMap.put('Country values', countryPicklistValues);
        System.debug('Country Picklist Values: ' + countryPicklistValues);
        System.debug('picklistValuesMap  ===>' + picklistValuesMap);
        return picklistValuesMap;
    }
}