global class Quebatchconupdate implements Database.Batchable<sObject> {

    global Database.QueryLocator start(Database.BatchableContext BC) {

        String query = 'SELECT Id,Description FROM Contact';

        return Database.getQueryLocator(query);

    }

   

    global void execute(Database.BatchableContext BC, List<contact> scope) {

         for(contact a : scope)

         {

             a.description = 'Updated';            

         }

         update scope;

    }   

    

    global void finish(Database.BatchableContext BC) {

    }

}