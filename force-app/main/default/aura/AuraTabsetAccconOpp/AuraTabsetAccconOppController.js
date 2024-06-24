({
    doInitCon: function(component, event, helper) {
        debugger;
        component.set("v.columnCon", [
            {label:"First Name", fieldName:"FirstName",type:"text"},
            {label:"Last Name", fieldName:"LastName",type:"text"},
            {label:"Phone", fieldName:"Phone",type:"phone"},
            {label:"Email", fieldName:"Email",type:"email"},
        ]);
            
            var action = component.get("c.getContactDetails");
            
            action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
            component.set("v.conListAura", response.getReturnValue());
            } else {
            console.error("Failed to fetch contact details");
            }
            });
            $A.enqueueAction(action);
     },
            
     doInitAcc: function(component, event, helper) {
            debugger;
            component.set("v.columnAcc", [
            {label:"Account Name", fieldName:"Name",type:"text"},
            {label:"Phone", fieldName:"Phone",type:"phone"},
            {label:"Type", fieldName:"Type",type:"text"},
        ]);
        
        var action = component.get("c.getAccountDetails");
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                // Set the data for the Lightning Datatable
                component.set("v.accListAura", response.getReturnValue());
            } else {
                console.error("Failed to fetch Account details");
            }
        });
        $A.enqueueAction(action);
    },
    
    doInitOpp: function(component, event, helper) {
        debugger;
        component.set("v.columnOpp", [
            {label:"Opportunity Name", fieldName:"Name",type:"text"},
            {label:"Close Date", fieldName:"CloseDate",type:"date"},
            {label:"Stage Name", fieldName:"StageName",type:"text"},
        ]);
            
            var action = component.get("c.getOpportunityDetails");
            action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
            component.set("v.oppListAura", response.getReturnValue());
            } else {
            console.error("Failed to fetch Opportunity details");
            }
            });
            $A.enqueueAction(action);
     },
            
     createNewContact: function(component, event, helper) {
            debugger;
            var createNewContact = $A.get("e.force:createRecord")
            createNewContact.setParams({
            "entityApiName":"Contact"
            });
            createNewContact.fire();
     },
            
     createNewAcc: function(component, event, helper) {
            var createNewAcc = $A.get("e.force:createRecord")
            createNewAcc.setParams({
            "entityApiName":"Account"
            });
            createNewAcc.fire();
     },
            
     createNewOpp: function(component, event, helper) {
            var createNewOpp = $A.get("e.force:createRecord")
            createNewOpp.setParams({
            "entityApiName":"Opportunity"
            });
            createNewOpp.fire();
      }
            
})