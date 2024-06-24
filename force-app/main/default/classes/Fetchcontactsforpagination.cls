public with sharing class Fetchcontactsforpagination {
@AuraEnabled(cacheable=true)
public static list<contact>getconlist(){
    list<contact>conlistrecords = new list<contact>();
    for(contact con: [select id,lastname,email,phone from contact]){
      conlistrecords.add(con);
    }
 return conlistrecords;
    }
     @AuraEnabled(cacheable= true)
    public static List<Contact> getContactList(){
        return [SELECT Id, Name FROM Contact];
    }
   
}