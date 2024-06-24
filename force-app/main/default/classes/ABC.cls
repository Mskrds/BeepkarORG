public class ABC {
    public ABC(){       //Constructor
        MethodFun1(); 
    }

    Public static void MethodFun1(){
        
        list<account>acc= [Select id from account limit 10];
         list<XYZ.AccountWrapper>callfun5fromfun1 = MethodFun5(acc);
          list<opportunity>Callxyzfun1fromMethodFun1 = XYZ.XYZFun1(acc);
      //for debug implemented for loop:  
        for(XYZ.AccountWrapper accwrap : callfun5fromfun1){
          //  System.debug('11.XYZ.AccountWrapper'+accwrap);
        }
        //iv & v-------xyzfun1 called from MethodFun1 
      
        for(opportunity Displayopp :Callxyzfun1fromMethodFun1){
            System.debug('16.Display the list of opportunities in Fun1 method'+Displayopp);
        }
        
    }
    

      Public static list<XYZ.AccountWrapper> MethodFun5(list<Account>Acclist){ // Class name and wrapper class name
     
          list<XYZ.AccountWrapper>CallXYZFun3fromfun5 = XYZ.XYZFun3(Acclist);
         
          //System.debug('CallXYZFun3fromfun5' +CallXYZFun3fromfun5);  
        return CallXYZFun3fromfun5 ;
        
          
          
      }
    
}