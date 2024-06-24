public class MapAssignmnetClass {
    
Public void mapassignment(string country,string state){ 
        map<string,list<State__c>> countrymap1=new  map<string,list<State__c>>();
        
        list<State__c> Statetocountry=[select id,name from State__c where Country_Name__r.name =:country];
        for(State__c s1:Statetocountry){
            if(!countrymap1.containskey(country)){
                countrymap1.put((country),new list<state__c>());
            }
            countrymap1.get(country).add(s1);
        } 
        map<string,list<string>> Statemap2=new map<string,list<string>>();
        list<City__c >citytostate=[select id,name from City__c  where State_Name__r.name=:state];
            for(City__c  c1:citytostate){
                if(!Statemap2.containskey(state)){
                    Statemap2.put((state),new list<string>{c1.name});
                }
                Statemap2.get(state).add(c1.name);
            }
        system.debug('citiess:::'+Statemap2);
    }  
    
}