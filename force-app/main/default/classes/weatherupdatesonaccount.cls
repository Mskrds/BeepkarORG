public class weatherupdatesonaccount {
    
    @future(callout=true)
    public static void  weatherinfo123(string ac){
        
        account abc = (Account)Json.deserialize(ac, Account.class);
        
        Http http = new Http();
        Httprequest request = new Httprequest();
        Request.setEndpoint('https://api.openweathermap.org/data/2.5/weather?q='+abc.State__c+'&appid=52ef9acc6fb2ecf49e11afb89b2449f6&units=metric');
        Request.setMethod('GET');
        HttpResponse Response = http.send(request);
        
        string temperature = ' 0.0';
        //If the Request is successful, parse the json Response
        Response.getStatuscode();
        //check if the HTTP response status code is 200, indicating a successful request.
        if(response.getStatusCode()== 200)  
        {
            System.debug('Response'+Response.getBody());
            map<String,Object> result = (map<string,object>)JSON.deserializeUntyped(response.getBody());
            map<string,object>mmap = (map<String,object>) result.get('main');
            //temperature = (string) mmap.get('temp');
            temperature = String.valueOf(mmap.get('temp')) ;
            
            system.debug('temperature --> ' +temperature);   
            list<Account> Acclist=new list<Account>();
            
            Account acc= new Account();
            
            acc.Temperature__c=temperature;
             
            acc.id= abc.id;
            Acclist.add(acc);
            update Acclist;    
            
        }
        
        
        // INSTANCE CREATION : Decimal Temp = WeatherInfo.weatherinfo('Kadapa');
        //System.Debug('Current Kadapa temperature is:'+temp);
        
    }
}