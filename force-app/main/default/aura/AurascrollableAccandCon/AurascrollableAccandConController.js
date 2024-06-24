({
	doInit : function(component, event, helper) {
        debugger;
		var action = component.get("c.getAccDetails");
        action.setCallback(this,function(response){
            var state = response.getState();
            if(state === "SUCCESS"){
                component.set("v.accDetails",response.getReturnValue());
            }else{
                console.error("failed to fetch account records");
            }
        });
        $A.enqueueAction(action);
	},
    
    createContact : function(component, event, helper) {
        debugger;
        var createContact = $A.get("e.force:createRecord")
            createContact.setParams({
            "entityApiName":"Contact"
            });
            createContact.fire();
    }
})