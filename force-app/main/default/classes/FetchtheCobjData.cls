public class FetchtheCobjData {
        
 /*   public static void triggerhandleracc(list<Account> acclist, Map<Id, Account> accmap){
        
    }
        public static void Assignment1(string RecordID){
            
            //Select id,ObjectDId__r.ObjectBId__r.ObjectAId__c from ObjectH__c where id = 'a0D5g00000ODdkpEAD' 
            list<ObjectH__c>collectdata=[Select id,ObjectDId__r.ObjectBId__r.ObjectAId__c from ObjectH__c where id =:RecordID];
            Set<id>AllIds =new set<Id>();
            for(ObjectH__c fetchobjA :collectdata)
            {
                AllIds.add(fetchobjA.ObjectDId__r.ObjectBId__r.ObjectAId__c);
                
            } 
            
            list<ObjectC__c>Assignment1 = [Select id,Name from ObjectC__c where ObjectAId__c In:AllIds];
            system.debug(Assignment1);
        } 
        
        
        public static void Assignment5(){
            //Select id,ObjectDId__r.ObjectBId__c from ObjectH__c where Id ='a0D5g00000ODdkpEAD'
            
            list<ObjectH__c>collectdata2=[Select id,ObjectDId__r.ObjectBId__c from ObjectH__c where Id ='a0D5g00000ODdkpEAD'];
            
            Set<id>AllIds =new set<Id>();
            for(ObjectH__c fetchobjE :collectdata2)
            {
                AllIds.add(fetchobjE.ObjectDId__r.ObjectBId__c);
            } 
            
            
            list<ObjectE__c>Assignment4 = [Select id,Name from ObjectE__c where ObjectBId__c In:AllIds];
            system.debug(Assignment4);
            
        }
        
         public static void Assignment4A(string onerecrid){
             //Select Id,Name,	ObjectEId__c from ObjectG__c where Id= 'a0C5g00000GZjZ4EAL'
             
             ObjectG__c GetEandFIds=[Select Id,Name,ObjectEId__r.name,ObjectFId__r.name from ObjectG__c where Id=: onerecrid];
             System.debug('GetobjEandF Record Id:'+GetEandFIds.objectFId__r.name);
             System.debug('GetobjEandF Record Id:'+GetEandFIds.objectFId__r.name);
             
             
             //Select id,(Select id,ObjectHId__r.name from ObjectI__r) from ObjectG__C Where Id='a0C5g00000GZjZ4EAL'
             ObjectG__C GetHrecordIds =[Select id,(Select id,ObjectHId__r.name from ObjectI__r) from ObjectG__C Where Id='a0C5g00000GZjZ4EAL'];
             for(ObjectI__C getHdata:GetHrecordIds.ObjectI__r){
             System.debug('GetobjHRecord Id:'+getHdata.objectHId__r.name);
                 
             }
            } 
             public static void Assignment4B(){
             //Select Id,Name, ObjectEId__c,ObjectFId__c,(Select id,ObjectHId__r.name from ObjectI__r) from ObjectG__c where Id= 'a0C5g00000GZjZ4EAL'
             
             ObjectG__c GetEFandHIds=[Select Id,Name, ObjectEId__c,ObjectFId__c,(Select id,ObjectHId__r.name from ObjectI__r) from ObjectG__c where Id='a0C5g00000GZjZ4EAL'];
           
             System.debug('GetobjHRecord Id:'+GetEFandHIds.objectFId__r.name);
             System.debug('GetobjHRecord Id:'+GetEFandHIds.objectEId__r.name);         
             for(ObjectI__C getHdata:GetEFandHIds.ObjectI__r){
             System.debug('GetobjHRecord Id:'+getHdata.objectHId__r.name);
             
             
         }      
             }
        //tring to pass two Id of G object and and getting two records of each object.
         public static void Assignment4C(List<ObjectG__c>TwoRecordIDs){
        
             
            List<ObjectG__c>GetEFandHIds=[Select Id,Name, ObjectEId__c,ObjectFId__c,(Select id,ObjectHId__r.name from ObjectI__r) from ObjectG__c where Id=:TwoRecordIDs];
           
                 System.debug('GetobjHRecord Id:'+GetEFandHIds[0].objectFId__r.name);
                 System.debug('GetobjHRecord Id:'+GetEFandHIds[0].objectEId__r.name);         
             for(ObjectI__C getHdata:GetEFandHIds[0].ObjectI__r){
             
                 System.debug('GetobjHRecord Id:'+getHdata.objectHId__r.name);
             
             
         }      
             } */
    }