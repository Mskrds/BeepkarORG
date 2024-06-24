// PastWeekTasksAndEventsController.cls
public class PastWeekTasksAndEventsController {
    @AuraEnabled
    public static eventandtask getTasksAndEvents() {
        
        Date lastWeek = Date.today().addDays(-7);
        eventandtask wrap = new eventandtask();
        List<Task> taskList = new List<Task>();
        List<Event> eventList = new List<Event>();
        for (Task task : [SELECT Who.Name, Who.Email,Subject,Status,CreatedDate FROM Task WHERE CreatedDate >= :lastWeek limit 3]) {
            taskList.add(task);
        }
        for (Event evt : [SELECT whatid,Subject,what.Email,what.type, CreatedDate FROM Event WHERE CreatedDate >= :lastWeek limit 3]) {
            eventList.add(evt);
        }
        System.debug('wrap === >'+wrap);
        wrap.tasklist = taskList; 
        wrap.Eventlist = eventList;
        return wrap;
    }
    
    public class eventandtask{
        @AuraEnabled
        public list<Task> tasklist {get;set;}
        @AuraEnabled
        public list<Event> Eventlist {get;set;}
    }
    
       // To fetch the task records 
      @AuraEnabled(cacheable=true)
    public static List<Task> getTasksByAccountId(String accountId) {
        return [SELECT Who.Name, Who.Email,Subject,Status FROM Task WHERE WhatId = :accountId limit 6];
    }
       // To retrieve picklist values from the backend
    @AuraEnabled(cacheable=true)
    public static List<String> getStatuspicklistvalues() {
       
        List<String> status = new List<String>();
        Schema.DescribeFieldResult fieldResult = Task.Status.getDescribe();
        List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();

        for (Schema.PicklistEntry picklistEntry : ple) {
            status.add(picklistEntry.getValue());
        }
        
        return status;
    }

    @AuraEnabled
    public static String updateTasks(List<Task> updatet, String accId, Integer completedcount) {
       
        String resultMessage = 'success';
     	System.debug('updatet'+updatet);
        try {
            if (updatet != null && !updatet.isEmpty()) {
                update updatet;
                System.debug('updatet'+updatet);
                 Account accToUpdate = [SELECT Id, CountofTaskcompeleted__c FROM Account WHERE Id = :accId];
                    accToUpdate.CountofTaskcompeleted__c = completedcount;

                  update accToUpdate;
                  System.debug('accToUpdate'+accToUpdate);
                  
            } else {
                resultMessage = 'No tasks to update';
            }
        } catch (Exception e) {
            resultMessage = 'error: ' + e.getMessage() + ' at line number ' + e.getLineNumber();
        }
        System.debug('resultMessage'+resultMessage);
        return resultMessage;
    }

}







// //to update the count of countoftaskcompleted__c field in task 
//    @AuraEnabled(cacheable=true)
//    public static void updateTaskStatus (List<task>taskupdate) {
//         set<ID>setids = new set<ID>();
//         for(Task tsk1 : taskupdate ){
//             setids.add(tsk1.AccountId);
//         }
        
//         List<Account> lstAcc = new List<Account>();
//         for(Account acc: [select Id, CountofTaskcompeleted__c,(Select id,Status FROM Tasks) FROM Account WHERE Id IN:setids ]){

//          for(task tsk2 : acc.Tasks){
//              if(tsk2.Status == 'Completed'){
//                    acc.CountofTaskcompeleted__c = acc.Tasks.size();
//                    lstAcc.add(acc); 
//              }
              
//          }
//          if(!lstAcc.isEmpty()){
//              update lstAcc;
//          }

//          }
// }