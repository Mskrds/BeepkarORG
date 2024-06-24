({
        createrecord : function(component, event, helper) {
            var action = component.get("c.CreateCityrecord"); // get the apex method
            
        
            action.setParams({'customobj':component.get('v.customobj')}); //Returns the collection of parameters for an action. 
            //setCallback (Object scope, function callback, String name)
            action.setCallback(this,function(result){ // Sets the callback function that is executed after an Apex action returns.
                
                var cityId = result.getReturnValue();
                component.set('v.cityId',cityId);
                
                alert("City record is successfully Created"+cityId);
                
             
            });
            $A.enqueueAction(action);
        }
 
    

          
    })