public class Collesctionassignment {
    
   /* Public Static void collection1(){
        list<string>Assgcontinue = new list<String>{'aa','bb','cc','dd'};
            for(String str : Assgcontinue){
                if(str == 'cc'){
                    Continue;
                }
                System.debug('Continue after cc:'+str);  
            }
    }
    
    //Break Assignament  
    Public static void Collection2(){
        list<string>AssigBreak =new list<String>{'aa','bb','cc','dd'};
            for(String str :AssigBreak ){
                if(str=='bb'){
                    Break;
                }
                System.debug('Break the BB:'+str);
            }  
    }
    
    Public static void Collection3(){
        integer i = 5;
        do{
            System.debug(i);
            i--;
        }
        while(i>0);
        
    }
    
    public static void Collection4(){
        
        Map<string,List<String>>mapofstring = new map<String,list<String>>();
        //Karnataka
        List<string> kAcitieslist = new List<string>{'Mysuru','Bengaluru','Hubli'};
            //Andhara pradesh
            List<string> APcitieslist = new List<string>{'Vijayawada','Tirupati','Vishakapatam'};
                
                mapofstring.put('Karnataka',kAcitieslist);
        mapofstring.put('Andhrapradesh',APcitieslist);
        
        System.debug('Andhrapradesh sate cities are:'+mapofstring.get('Andhrapradesh'));
        System.debug('Karnataka sate cities are:'+mapofstring.get('Karnataka'));
    }
    
    
    public static void Collection6(){
        
        map<string,Map<string,List<String>>>statesByCountrywithcitites = new map<string,map<String,list<String>>>();
        Map<string,List<String>> citiesNameByState = new map<String,list<String>>();
        //Andhara pradesh
        List<string> APcitieslist = new List<string>{'Vijayawada','Tirupati','Vishakapatam'};
           
        citiesNameByState.put('Andhrapradesh',APcitieslist);
        statesByCountrywithcitites.put('India',citiesNameByState);  
        
        System.debug('India sate and cities are:'+statesByCountrywithcitites.get('India'));
        
    }
    
    public static void Collection5A(){
        Map<Id,List<Opportunity>> accountOppMap = new Map<Id,List<Opportunity>>();
        List<opportunity>Fetchopp = [select id,Amount,CloseDate,AccountId from opportunity];
        for(Opportunity opp :Fetchopp){
            List<Opportunity> opplst = accountOppMap.get(opp.AccountId);
            if(!opplst.isempty()){
                opplst = new List<Opportunity>(); // instance creation
                opplst.add(opp);
                accountOppMap.put(opp.accountId,opplst);
            }
            system.debug('AccOppMap ===> ' +accountOppMap.get(opp.AccountId));
        }
    }
    //Key=AccountId values = No.of Opportunities
    public static void Collection5(){
        Map<id,list<opportunity>> opportunitymap = new Map<id,list<opportunity>>();
        List<opportunity>Fetchopp = [select id,Amount,CloseDate,AccountId from opportunity where accountid!=null limit 5];//soql
        for(opportunity oppoq:Fetchopp){ // looping
            
            if(!opportunitymap.containskey(oppoq.AccountId)){ // applied the condition -if map= have not oppo(record) with parent(accountid)
                
                opportunitymap.put(oppoq.AccountId,new List<opportunity>()); //creating a block and
            }
            opportunitymap.get(oppoq.AccountId).add(oppoq);
            
            system.debug('AccOppMap ===> ' +opportunitymap.get(oppoq.AccountId));
            
        }
        
    } */
}