public class customPathStatusCtrl {
 
     @AuraEnabled
    public static Opportunity stageNamePath(String recId){
        Opportunity stageList = [SELECT Id, Name, StageName FROM Opportunity WHERE Id=:recId];
        system.debug('stageList ' +stageList);
        RETURN stageList;
    }
 
}