({
    handleCreateContact : function(component, event, helper) {
        debugger;
        var contactData = component.get('v.newcontact');
        
        var action = component.get("c.createContact"); // get apex method
        action.setParams({'contactobj' :contactData }) // and set paramenters
        
        action.setCallback(this, function(response) {                                                 // my last save 
            var state = response.getState();
            
            
            if (state === "SUCCESS") {
              component.set("v.message","created");
                    }
            
                 else if(state === "ERROR") {
                    console.log('problem saving on record' + state);
                } 
        else{
            console.log('Unknown error' + state);
        }
            
        });
      
        $A.enqueueAction(action);
    }
})